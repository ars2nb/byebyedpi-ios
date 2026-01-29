import Foundation

public struct CommandPlan: Hashable, Codable {
    public var steps: [CommandStep]

    public init(steps: [CommandStep]) {
        self.steps = steps
    }
}

public struct CommandStep: Hashable, Codable {
    public var name: String
    public var arguments: [String]
    public var hint: String

    public init(name: String, arguments: [String], hint: String) {
        self.name = name
        self.arguments = arguments
        self.hint = hint
    }
}
