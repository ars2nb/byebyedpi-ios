import Foundation

public struct CommandFlag: Hashable, Codable {
    public let name: String
    public let value: String?

    public init(name: String, value: String? = nil) {
        self.name = name
        self.value = value
    }
}

public struct CommandPreset: Hashable, Codable {
    public let id: UUID
    public let name: String
    public let description: String
    public let flags: [CommandFlag]

    public init(id: UUID = UUID(), name: String, description: String, flags: [CommandFlag]) {
        self.id = id
        self.name = name
        self.description = description
        self.flags = flags
    }

    public var arguments: [String] {
        flags.flatMap { flag in
            if let value = flag.value {
                return [flag.name, value]
            }
            return [flag.name]
        }
    }
}

public enum NetworkEnvironment: String, Codable {
    case cellular
    case wifi
    case unknown
}

public struct CommandSelection: Hashable, Codable {
    public let preset: CommandPreset
    public let environment: NetworkEnvironment
    public let reason: String

    public init(preset: CommandPreset, environment: NetworkEnvironment, reason: String) {
        self.preset = preset
        self.environment = environment
        self.reason = reason
    }
}
