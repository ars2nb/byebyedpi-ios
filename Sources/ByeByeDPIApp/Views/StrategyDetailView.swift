import SwiftUI

struct StrategyDetailView: View {
    @EnvironmentObject var appState: AppState
    let preset: CommandPreset

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(preset.name)
                .font(.title2)
                .fontWeight(.semibold)

            Text(preset.command)
                .font(.caption)
                .foregroundColor(.secondary)
                .textSelection(.enabled)

            Spacer()

            Button(action: applyPreset) {
                Text("Применить стратегию")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .navigationTitle("Стратегия")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func applyPreset() {
        appState.selectedCommandID = preset.id
    }
}
