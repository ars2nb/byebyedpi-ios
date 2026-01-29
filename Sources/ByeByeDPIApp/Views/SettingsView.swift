import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Form {
            Section("VPN") {
                Toggle("Включать VPN при запуске", isOn: $appState.startOnLaunch)
                Toggle("Использовать IPv6", isOn: $appState.useIpv6)
            }

            Section("DNS") {
                Toggle("Переопределять DNS", isOn: $appState.useDns)
                TextField("Адрес DNS", text: $appState.dnsAddress)
                    .textContentType(.URL)
                    .keyboardType(.URL)
                    .disabled(!appState.useDns)
            }

            Section("Подбор команд") {
                Picker("Стратегия", selection: $appState.selectedStrategyID) {
                    ForEach(Strategy.all) { strategy in
                        VStack(alignment: .leading) {
                            Text(strategy.title)
                            Text(strategy.detail)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .tag(strategy.id)
                    }
                }

                Picker("Команда", selection: $appState.selectedCommandID) {
                    ForEach(CommandPreset.all) { preset in
                        Text(preset.name)
                            .tag(preset.id)
                    }
                }

                Text(appState.selectedPreset.command)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .textSelection(.enabled)
            }

            Section("Подбор стратегий") {
                NavigationLink("Перейти к подбору") {
                    StrategyTestView()
                }
                Text("Запускает последовательную проверку всех пресетов.")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Section("Домены для подбора") {
                ForEach(DomainList.youtubeTargets, id: \.self) { domain in
                    Text(domain)
                }
            }

            Section("Версия") {
                Text(appState.appVersion)
            }
        }
        .navigationTitle("Настройки")
    }
}
