import Foundation

public struct CommandSelector {
    public init() {}

    public func makeProfile(
        for strategy: DpiStrategy,
        routePolicy: RoutePolicy
    ) -> DpiProfile {
        let mutation = mutationPlan(for: strategy)
        let plan = CommandPlan(steps: commandSteps(for: strategy, mutation: mutation, routePolicy: routePolicy))

        return DpiProfile(
            name: strategy.displayName,
            description: strategy.descriptionText(routePolicy: routePolicy),
            strategy: strategy,
            mutationPlan: mutation,
            commandPlan: plan
        )
    }

    private func mutationPlan(for strategy: DpiStrategy) -> MutationPlan {
        switch strategy {
        case .safe:
            return MutationPlan(ttl: 64, windowSize: 1024, splitCount: 2, paddingBytes: 32)
        case .balanced:
            return MutationPlan(ttl: 64, windowSize: 768, splitCount: 3, paddingBytes: 64)
        case .aggressive:
            return MutationPlan(ttl: 32, windowSize: 512, splitCount: 4, paddingBytes: 96)
        case .randomized:
            return MutationPlan(ttl: 64, windowSize: 640, splitCount: 3, paddingBytes: 80)
        }
    }

    private func commandSteps(
        for strategy: DpiStrategy,
        mutation: MutationPlan,
        routePolicy: RoutePolicy
    ) -> [CommandStep] {
        var steps: [CommandStep] = []

        let base = CommandTemplates.baseArguments(mutation: mutation)
        let routing = routePolicy.arguments

        steps.append(
            CommandStep(
                name: "base",
                arguments: base + routing,
                hint: "Base mutation parameters with routing policy."
            )
        )

        switch strategy {
        case .safe:
            steps.append(
                CommandStep(
                    name: "desync",
                    arguments: CommandTemplates.desyncArguments(mode: "fake") + CommandTemplates.layer7Arguments(),
                    hint: "Lightweight desync with header normalization."
                )
            )
        case .balanced:
            steps.append(
                CommandStep(
                    name: "desync",
                    arguments: CommandTemplates.desyncArguments(mode: "split") + CommandTemplates.layer7Arguments(),
                    hint: "Split packets with header normalization."
                )
            )
            steps.append(
                CommandStep(
                    name: "tls",
                    arguments: CommandTemplates.tlsArguments(),
                    hint: "Apply TLS padding and record split."
                )
            )
        case .aggressive:
            steps.append(
                CommandStep(
                    name: "desync",
                    arguments: CommandTemplates.desyncArguments(mode: "disorder") + CommandTemplates.layer7Arguments(),
                    hint: "Disorder packets with extra HTTP tweaks."
                )
            )
            steps.append(
                CommandStep(
                    name: "tls",
                    arguments: CommandTemplates.tlsArguments() + ["--tls-sni-mix"],
                    hint: "Aggressive TLS obfuscation."
                )
            )
            steps.append(
                CommandStep(
                    name: "http",
                    arguments: CommandTemplates.httpArguments() + ["--http-case", "random"],
                    hint: "Extra HTTP header mutations."
                )
            )
        case .randomized:
            steps.append(
                CommandStep(
                    name: "desync",
                    arguments: CommandTemplates.desyncArguments(mode: "fake") + ["--randomize"],
                    hint: "Randomized fake desync packets."
                )
            )
            steps.append(
                CommandStep(
                    name: "tls",
                    arguments: CommandTemplates.tlsArguments() + ["--tls-padding", "192"],
                    hint: "Variable padding for TLS."
                )
            )
            steps.append(
                CommandStep(
                    name: "http",
                    arguments: CommandTemplates.httpArguments() + ["--http-spacing", "random"],
                    hint: "Random spacing for HTTP.")
            )
        }

        return steps
    }
}

private extension DpiStrategy {
    var displayName: String {
        switch self {
        case .safe:
            return "Safe"
        case .balanced:
            return "Balanced"
        case .aggressive:
            return "Aggressive"
        case .randomized:
            return "Randomized"
        }
    }

    func descriptionText(routePolicy: RoutePolicy) -> String {
        switch self {
        case .safe:
            return "Minimal mutations with \(routePolicy.displayName) routing."
        case .balanced:
            return "Balanced mix of split and TLS tweaks with \(routePolicy.displayName) routing."
        case .aggressive:
            return "Heavy desync and HTTP mutations for \(routePolicy.displayName) routing."
        case .randomized:
            return "Randomized mutations with \(routePolicy.displayName) routing."
        }
    }
}
