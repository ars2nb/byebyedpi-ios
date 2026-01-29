import Foundation

struct StrategyTestResult: Identifiable {
    enum Status: String {
        case idle
        case running
        case done
    }

    let id: String
    let name: String
    let command: String
    var testedCount: Int
    var totalCount: Int
    var status: Status

    var progressLabel: String {
        "\(testedCount)/\(totalCount)"
    }

    static func placeholder(for preset: CommandPreset) -> StrategyTestResult {
        StrategyTestResult(
            id: preset.id,
            name: preset.name,
            command: preset.command,
            testedCount: 0,
            totalCount: DomainList.youtubeTargets.count,
            status: .idle
        )
    }

    static func bootstrapTests() -> [String: StrategyTestResult] {
        Dictionary(
            uniqueKeysWithValues: CommandPreset.all.map { preset in
                (preset.id, StrategyTestResult.placeholder(for: preset))
            }
        )
    }
}
