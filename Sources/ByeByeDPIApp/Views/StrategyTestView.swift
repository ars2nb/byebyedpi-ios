import SwiftUI

struct StrategyTestView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 16) {
            Button(action: appState.startStrategyTest) {
                Text(appState.isTestingStrategies ? "Подбор идёт..." : "Начать подбор")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(appState.isTestingStrategies ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(appState.isTestingStrategies)

            List {
                ForEach(CommandPreset.all) { preset in
                    NavigationLink {
                        StrategyDetailView(preset: preset)
                    } label: {
                        StrategyTestRow(
                            result: appState.strategyTests[preset.id] ?? StrategyTestResult.placeholder(for: preset)
                        )
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Подбор стратегий")
    }
}

private struct StrategyTestRow: View {
    let result: StrategyTestResult

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(result.name)
                    .font(.headline)
                Text(result.command)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text(result.progressLabel)
                    .font(.subheadline)
                Text(statusLabel)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }

    private var statusLabel: String {
        switch result.status {
        case .idle:
            return "Ожидание"
        case .running:
            return "Проверка"
        case .done:
            return "Готово"
        }
    }
}
