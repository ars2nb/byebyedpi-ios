import Foundation

public struct DpiProfile: Hashable, Codable {
    public let id: UUID
    public var name: String
    public var description: String
    public var strategy: DpiStrategy
    public var mutationPlan: MutationPlan
    public var commandPlan: CommandPlan

    public init(
        id: UUID = UUID(),
        name: String,
        description: String,
        strategy: DpiStrategy,
        mutationPlan: MutationPlan,
        commandPlan: CommandPlan
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.strategy = strategy
        self.mutationPlan = mutationPlan
        self.commandPlan = commandPlan
    }
}

public enum DpiStrategy: String, Codable, CaseIterable {
    case safe
    case balanced
    case aggressive
    case randomized
}

public struct MutationPlan: Hashable, Codable {
    public var ttl: UInt8
    public var windowSize: UInt16
    public var splitCount: Int
    public var paddingBytes: Int

    public init(ttl: UInt8, windowSize: UInt16, splitCount: Int, paddingBytes: Int) {
        self.ttl = ttl
        self.windowSize = windowSize
        self.splitCount = splitCount
        self.paddingBytes = paddingBytes
    }
}
