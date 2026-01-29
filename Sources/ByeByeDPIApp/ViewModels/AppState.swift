import Foundation

final class AppState: ObservableObject {
    @Published var isVpnEnabled = false
    @Published var startOnLaunch = false
    @Published var useIpv6 = false
    @Published var useDns = false
    @Published var dnsAddress = ""
    @Published var appVersion = "0.1.0"
    @Published var selectedStrategyID = Strategy.defaultStrategy.id
    @Published var selectedCommandID = CommandPreset.defaultPreset.id

    var selectedStrategy: Strategy {
        Strategy.all.first { $0.id == selectedStrategyID } ?? Strategy.defaultStrategy
    }

    var selectedPreset: CommandPreset {
        CommandPreset.all.first { $0.id == selectedCommandID } ?? CommandPreset.defaultPreset
    }
}
