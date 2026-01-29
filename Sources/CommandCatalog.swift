import Foundation

public struct CommandCatalog {
    public static let shared = CommandCatalog()

    public let presets: [CommandPreset]

    public init() {
        presets = [
            CommandPreset(
                name: "Balanced",
                description: "Средний профиль для большинства сетей.",
                flags: [
                    CommandFlag(name: "--silent"),
                    CommandFlag(name: "--auto-ttl"),
                    CommandFlag(name: "--split-position", value: "2"),
                    CommandFlag(name: "--dns", value: "1.1.1.1")
                ]
            ),
            CommandPreset(
                name: "Aggressive",
                description: "Агрессивный профиль для сложных DPI.",
                flags: [
                    CommandFlag(name: "--silent"),
                    CommandFlag(name: "--fake-sni", value: "cloudflare-dns.com"),
                    CommandFlag(name: "--split-position", value: "3"),
                    CommandFlag(name: "--checksum"),
                    CommandFlag(name: "--dns", value: "9.9.9.9")
                ]
            ),
            CommandPreset(
                name: "Mobile",
                description: "Оптимизация для мобильных сетей и экономии батареи.",
                flags: [
                    CommandFlag(name: "--silent"),
                    CommandFlag(name: "--auto-ttl"),
                    CommandFlag(name: "--segment", value: "2"),
                    CommandFlag(name: "--dns", value: "8.8.8.8")
                ]
            )
        ]
    }

    public func preset(named name: String) -> CommandPreset? {
        presets.first { $0.name.caseInsensitiveCompare(name) == .orderedSame }
    }
}
