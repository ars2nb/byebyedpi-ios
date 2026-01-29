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
    @Published var isTestingStrategies = false
    @Published var strategyTests: [String: StrategyTestResult] = StrategyTestResult.bootstrapTests()

    var selectedStrategy: Strategy {
        Strategy.all.first { $0.id == selectedStrategyID } ?? Strategy.defaultStrategy
    }

    var selectedPreset: CommandPreset {
        CommandPreset.all.first { $0.id == selectedCommandID } ?? CommandPreset.defaultPreset
    }

    @MainActor
    func startStrategyTest() {
        guard !isTestingStrategies else { return }
        isTestingStrategies = true
        strategyTests = StrategyTestResult.bootstrapTests()

        Task {
            await runStrategyTests()
        }
    }

    @MainActor
    private func runStrategyTests() async {
        let totalTargets = DomainList.youtubeTargets.count

        for preset in CommandPreset.all {
            updateTest(presetID: preset.id, tested: 0, total: totalTargets, status: .running)
            if totalTargets == 0 {
                updateTest(presetID: preset.id, tested: 0, total: 0, status: .done)
                continue
            }

            for index in 1...totalTargets {
                try? await Task.sleep(nanoseconds: 80_000_000)
                updateTest(presetID: preset.id, tested: index, total: totalTargets, status: .running)
            }
            updateTest(presetID: preset.id, tested: totalTargets, total: totalTargets, status: .done)
        }

        isTestingStrategies = false
    }

    @MainActor
    private func updateTest(presetID: String, tested: Int, total: Int, status: StrategyTestResult.Status) {
        guard var test = strategyTests[presetID] else { return }
        test.testedCount = tested
        test.totalCount = total
        test.status = status
        strategyTests[presetID] = test
    }
}
