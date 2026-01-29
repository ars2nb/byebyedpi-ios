import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    Text("ByeByeDPI iOS")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(appState.isVpnEnabled ? "VPN включен" : "VPN выключен")
                        .foregroundColor(appState.isVpnEnabled ? .green : .secondary)
                }

                Button(action: toggleVpn) {
                    Text(appState.isVpnEnabled ? "Выключить VPN" : "Включить VPN")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(appState.isVpnEnabled ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Подбор команд")
                        .font(.headline)
                    Text("Стратегия: \(appState.selectedStrategy.title)")
                        .font(.subheadline)
                    Text("Команда: \(appState.selectedPreset.name)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Применяется к VPN при выборе стратегии.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Целевые домены")
                        .font(.headline)
                    Text("Список содержит \(DomainList.youtubeTargets.count) доменов YouTube/Google.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)

                Spacer()
            }
            .padding()
            .navigationTitle("Главная")
            .toolbar {
                NavigationLink("Настройки") {
                    SettingsView()
                }
            }
        }
    }

    private func toggleVpn() {
        appState.isVpnEnabled.toggle()
    }
}
