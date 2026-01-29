import Foundation

public struct CommandFormatter {
    public init() {}

    public func format(plan: CommandPlan) -> String {
        plan.steps
            .map { step in
                let args = step.arguments.joined(separator: " ")
                return "# \(step.name)\n\(args)\n# \(step.hint)"
            }
            .joined(separator: "\n\n")
    }
}
