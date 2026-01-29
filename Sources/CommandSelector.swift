import Foundation

public struct CommandSelector {
    public init() {}

    public func selectPreset(
        environment: NetworkEnvironment,
        hasPacketLoss: Bool,
        needsExtraObfuscation: Bool
    ) -> CommandSelection {
        let catalog = CommandCatalog.shared

        if needsExtraObfuscation {
            let preset = catalog.preset(named: "Aggressive") ?? catalog.presets[0]
            return CommandSelection(
                preset: preset,
                environment: environment,
                reason: "Требуется дополнительное сокрытие трафика."
            )
        }

        if environment == .cellular || hasPacketLoss {
            let preset = catalog.preset(named: "Mobile") ?? catalog.presets[0]
            return CommandSelection(
                preset: preset,
                environment: environment,
                reason: "Мобильная сеть или потери пакетов, нужен щадящий режим."
            )
        }

        let preset = catalog.preset(named: "Balanced") ?? catalog.presets[0]
        return CommandSelection(
            preset: preset,
            environment: environment,
            reason: "Стандартный профиль для стабильной сети."
        )
    }
}
