import SwiftUI

// MARK: - Models

struct Strategy: Identifiable {
    let id: String
    let title: String
    let detail: String

    static let all: [Strategy] = [
        Strategy(
            id: "sequential",
            title: "Последовательный перебор",
            detail: "Пробует команды по очереди, пока не найдёт рабочую."
        ),
        Strategy(
            id: "random",
            title: "Случайный перебор",
            detail: "Перемешивает команды перед подбором."
        ),
        Strategy(
            id: "weighted",
            title: "Приоритетный перебор",
            detail: "Начинает с самых частых комбинаций, затем идёт дальше."
        )
    ]

    static let defaultStrategy = Strategy.all[0]
}

struct CommandPreset: Identifiable {
    let id: String
    let name: String
    let command: String

    static let all: [CommandPreset] = [
        CommandPreset(id: "preset-001", name: "Профиль 1", command: "-f-200 -Qr -s3:5+sm -a1 -As -d1 -s4+sm -s8+sh -f-300 -d6+sh -a1 -At,r,s -o2 -f-30 -As -r5 -Mh -r6+sh -f-250 -s2:7+s -s3:6+sm -a1 -At,r,s -s3:5+sm -s6+s -s7:9+s -q30+sm -a1"),
        CommandPreset(id: "preset-002", name: "Профиль 2", command: "-d1 -d3+s -s6+s -d9+s -s12+s -d15+s -s20+s -d25+s -s30+s -d35+s -r1+s -S -a1 -As -d1 -d3+s -s6+s -d9+s -s12+s -d15+s -s20+s -d25+s -s30+s -d35+s -S -a1"),
        CommandPreset(id: "preset-003", name: "Профиль 3", command: "-q2 -s2 -s3+s -r3 -s4 -r4 -s5+s -r5+s -s6 -s7+s -r8 -s9+s -Qr -Mh,d,r -a1 -At,r -s2+s -r2 -d2 -s3 -r3 -r4 -s4 -d5+s -r5 -d6 -s7+s -d7 -a1"),
        CommandPreset(id: "preset-004", name: "Профиль 4", command: "-o1 -d1 -a1 -At,r,s -s1 -d1 -s5+s -s10+s -s15+s -s20+s -r1+s -S -a1 -As -s1 -d1 -s5+s -s10+s -s15+s -s20+s -S -a1"),
        CommandPreset(id: "preset-005", name: "Профиль 5", command: "-n {sni} -Qr -f-204 -s1:5+sm -a1 -As -d1 -s3+s -s5+s -q7 -a1 -As -o2 -f-43 -a1 -As -r5 -Mh -s1:5+s -s3:7+sm -a1"),
        CommandPreset(id: "preset-006", name: "Профиль 6", command: "-n {sni} -Qr -f-205 -a1 -As -s1:3+sm -a1 -As -s5:8+sm -a1 -As -d3 -q7 -o2 -f-43 -f-85 -f-165 -r5 -Mh -a1"),
        CommandPreset(id: "preset-007", name: "Профиль 7", command: "-d1+s -s50+s -a1 -As -f20 -r2+s -a1 -At -d2 -s1+s -s5+s -s10+s -s15+s -s25+s -s35+s -s50+s -s60+s -a1"),
        CommandPreset(id: "preset-008", name: "Профиль 8", command: "-o1 -a1 -At,r,s -f-1 -a1 -At,r,s -d1:11+sm -S -a1 -At,r,s -n {sni} -Qr -f1 -d1:11+sm -s1:11+sm -S -a1"),
        CommandPreset(id: "preset-009", name: "Профиль 9", command: "-d1 -s1 -q1 -Y -a1 -Ar -s5 -o1+s -d3+s -s6+s -d9+s -s12+s -d15+s -s20+s -d25+s -s30+s -d35+s -a1"),
        CommandPreset(id: "preset-010", name: "Профиль 10", command: "-f1+nme -t6 -a1 -As -n {sni} -Qr -s1:6+sm -a1 -As -s5:12+sm -a1 -As -d3 -q7 -r6 -Mh -a1"),
        CommandPreset(id: "preset-011", name: "Профиль 11", command: "-s1 -o1 -a1 -Y -Ar -s5 -o1+s -a1 -At -f-1 -r1+s -a1 -As -s1 -o1+s -s-1 -a1"),
        CommandPreset(id: "preset-012", name: "Профиль 12", command: "-s1 -d1 -a1 -Y -Ar -d5 -o1+s -a1 -At -f-1 -r1+s -a1 -As -d1 -o1+s -s-1 -a1"),
        CommandPreset(id: "preset-013", name: "Профиль 13", command: "-d1 -s1+s -d3+s -s6+s -d9+s -s12+s -d15+s -s20+s -d25+s -s30+s -d35+s -a1"),
        CommandPreset(id: "preset-014", name: "Профиль 14", command: "-s1 -q1 -a1 -Y -Ar -a1 -s5 -o2 -At -f-1 -r1+s -a1 -As -s1 -o1+s -s-1 -a1"),
        CommandPreset(id: "preset-015", name: "Профиль 15", command: "-s1 -q1 -a1 -Ar -s5 -o1+s -a1 -At -f-1 -d1+s -a1 -As -s1 -o1+s -s-1 -a1"),
        CommandPreset(id: "preset-016", name: "Профиль 16", command: "-s1 -q1 -a1 -Ar -s5 -o2 -a1 -At -f-1 -r1+s -a1 -As -s1 -o1+s -s-1 -a1"),
        CommandPreset(id: "preset-017", name: "Профиль 17", command: "-d1 -s1+s -d1+s -s3+s -d6+s -s12+s -d14+s -s20+s -d24+s -s30+s -a1"),
        CommandPreset(id: "preset-018", name: "Профиль 18", command: "-s1 -q1 -a1 -Y -At -a1 -S -f-1 -r1+s -a1 -As -d1+s -O1 -s29+s -a1"),
        CommandPreset(id: "preset-019", name: "Профиль 19", command: "-o1 -a1 -At,r,s -f-1 -a1 -Ar,s -o1 -a1 -At -r1+s -f-1 -t6 -a1"),
        CommandPreset(id: "preset-020", name: "Профиль 20", command: "-d1 -s1+s -s3+s -s6+s -s9+s -s12+s -s15+s -s20+s -s30+s -a1"),
        CommandPreset(id: "preset-021", name: "Профиль 21", command: "-f1 -t5 -n {sni} -q3+h -Qr -f2 -q1 -r1+s -t15 -q1 -o2 -a1"),
        CommandPreset(id: "preset-022", name: "Профиль 22", command: "-n {sni} -d2:5:2+h -f-3 -r2+sm -o2 -o50+s -r2+s -f-4 -a1"),
        CommandPreset(id: "preset-023", name: "Профиль 23", command: "-r-1+s -o20+sm -s3:7+sm -d5:3+sm -f300+s -Qr -Y -f-1 -a1"),
        CommandPreset(id: "preset-024", name: "Профиль 24", command: "-f-1 -Qr -s1+sm -d3+s -s5+sm -o2 -a1 -As -r1+s -d8+s -a1"),
        CommandPreset(id: "preset-025", name: "Профиль 25", command: "-s25 -r5+s -s25+s -a1 -At,r,s -s50 -r5+s -s50+s -a1"),
        CommandPreset(id: "preset-026", name: "Профиль 26", command: "-o1 -r-5+se -a1 -At,r,s -d1 -n {sni} -Qr -f-1 -a1"),
        CommandPreset(id: "preset-027", name: "Профиль 27", command: "-s1 -d1 -r1+s -a1 -Ar -o1 -a1 -At -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-028", name: "Профиль 28", command: "-s1 -q1 -r1+s -a1 -Ar -o1 -a1 -At -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-029", name: "Профиль 29", command: "-s1 -o1 -r1+s -a1 -Ar -o1 -a1 -At -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-030", name: "Профиль 30", command: "-n {sni} -Qr -f6+nr -d2 -d11 -f9+hm -o3 -t7 -a1"),
        CommandPreset(id: "preset-031", name: "Профиль 31", command: "-s1 -d1 -o1 -a1 -Ar -o3 -a1 -At -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-032", name: "Профиль 32", command: "-d9+s -q20+s -s25+s -t5 -a1 -At,r,s -r1+h -a1"),
        CommandPreset(id: "preset-033", name: "Профиль 33", command: "-q1+s -s29+s -s30+s -s14+s -o5+s -f-1 -S -a1"),
        CommandPreset(id: "preset-034", name: "Профиль 34", command: "-d1 -s1+s -r1+s -e1 -m1 -o1+s -f-1 -t2 -a1"),
        CommandPreset(id: "preset-035", name: "Профиль 35", command: "-d9+s -q20+s -s 25+s -t5 -At,r,s -r1+h -a1"),
        CommandPreset(id: "preset-036", name: "Профиль 36", command: "-s1 -o1 -a1 -Ar -o1 -a1 -At -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-037", name: "Профиль 37", command: "-d1 -o1 -a1 -Ar -o1 -a1 -At -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-038", name: "Профиль 38", command: "-d1 -s4 -d8 -s1+s -d5+s -s10+s -d20+s -a1"),
        CommandPreset(id: "preset-039", name: "Профиль 39", command: "-n {sni} -Qr -d5+sm -f3+sm -o2 -t4 -a1"),
        CommandPreset(id: "preset-040", name: "Профиль 40", command: "-o1 -a1 -Ar -q1 -a1 -At -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-041", name: "Профиль 41", command: "-q1 -a1 -Ar -o1 -a1 -At -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-042", name: "Профиль 42", command: "-s1 -q1 -Y -a1 -At,r,s -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-043", name: "Профиль 43", command: "-s1 -o1 -Y -a1 -At,r,s -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-044", name: "Профиль 44", command: "-s1 -d1 -Y -a1 -At,r,s -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-045", name: "Профиль 45", command: "-n {sni} -Qr -f209 -s1+sm -R1-3 -a1"),
        CommandPreset(id: "preset-046", name: "Профиль 46", command: "-s1 -q1 -a1 -At,r,s -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-047", name: "Профиль 47", command: "-s1 -o1 -a1 -At,r,s -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-048", name: "Профиль 48", command: "-s1 -d1 -a1 -At,r,s -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-049", name: "Профиль 49", command: "-s4+sn -r9+s -Qr -n {sni} -S -a1"),
        CommandPreset(id: "preset-050", name: "Профиль 50", command: "-n {sni} -Qr -m0x02 -f-1 -d7 -a1"),
        CommandPreset(id: "preset-051", name: "Профиль 51", command: "-o1 -d1 -r1+s -S -s1+s -d3+s -a1"),
        CommandPreset(id: "preset-052", name: "Профиль 52", command: "-d1 -r1+s -f-1 -S -t8 -o3+s -a1"),
        CommandPreset(id: "preset-053", name: "Профиль 53", command: "-q1+s -s29+s -o5+s -f-1 -S -a1"),
        CommandPreset(id: "preset-054", name: "Профиль 54", command: "-d1 -s1+s -r1+s -f-1 -t8 -a1"),
        CommandPreset(id: "preset-055", name: "Профиль 55", command: "-o1 -a1 -An -f1+nme -t6 -a1"),
        CommandPreset(id: "preset-056", name: "Профиль 56", command: "-n {sni} -Qr -f-1 -r1+s -a1"),
        CommandPreset(id: "preset-057", name: "Профиль 57", command: "-n {sni} -Qr -d1:3 -f-1 -a1"),
        CommandPreset(id: "preset-058", name: "Профиль 58", command: "-s1 -d3+s -a1 -At -r1+s -a1"),
        CommandPreset(id: "preset-059", name: "Профиль 59", command: "-o1 -a1 -At,r,s -d1 -a1"),
        CommandPreset(id: "preset-060", name: "Профиль 60", command: "-q1 -a1 -At,r,s -d1 -a1"),
        CommandPreset(id: "preset-061", name: "Профиль 61", command: "-n {sni} -Qr -d1 -f-1"),
        CommandPreset(id: "preset-062", name: "Профиль 62", command: "-d1+s -o2 -s5 -r5 -a1"),
        CommandPreset(id: "preset-063", name: "Профиль 63", command: "-r8 -o2 -s7 -q4+s -a1"),
        CommandPreset(id: "preset-064", name: "Профиль 64", command: "-d6+s -q4+hm -o2 -a1"),
        CommandPreset(id: "preset-065", name: "Профиль 65", command: "-s1+s -d3+s -a1"),
        CommandPreset(id: "preset-066", name: "Профиль 66", command: "-s1 -f-1 -S -a1"),
        CommandPreset(id: "preset-067", name: "Профиль 67", command: "-o1+s -d3+s -a1"),
        CommandPreset(id: "preset-068", name: "Профиль 68", command: "-o1 -s4 -s6 -a1"),
        CommandPreset(id: "preset-069", name: "Профиль 69", command: "-q1 -r25+s -a1"),
        CommandPreset(id: "preset-070", name: "Профиль 70", command: "-d1 -s3+s -a1"),
        CommandPreset(id: "preset-071", name: "Профиль 71", command: "-o3 -d7 -a1"),
        CommandPreset(id: "preset-072", name: "Профиль 72", command: "-d7 -s2 -a1")
    ]

    static let defaultPreset = CommandPreset.all[0]
}

struct DomainList {
    static let youtubeTargets: [String] = [
        "youtu.be",
        "youtube.com",
        "i.ytimg.com",
        "i9.ytimg.com",
        "yt3.ggpht.com",
        "yt4.ggpht.com",
        "googleapis.com",
        "jnn-pa.googleapis.com",
        "googleusercontent.com",
        "signaler-pa.youtube.com",
        "youtubei.googleapis.com",
        "manifest.googlevideo.com",
        "yt3.googleusercontent.com",
        "rr1---sn-4axm-n8vs.googlevideo.com",
        "rr1---sn-gvnuxaxjvh-o8ge.googlevideo.com",
        "rr1---sn-ug5onuxaxjvh-p3ul.googlevideo.com",
        "rr1---sn-ug5onuxaxjvh-n8v6.googlevideo.com",
        "rr4---sn-q4flrnsl.googlevideo.com",
        "rr10---sn-gvnuxaxjvh-304z.googlevideo.com",
        "rr14---sn-n8v7kn7r.googlevideo.com",
        "rr16---sn-axq7sn76.googlevideo.com",
        "rr1---sn-8ph2xajvh-5xge.googlevideo.com",
        "rr1---sn-gvnuxaxjvh-5gie.googlevideo.com",
        "rr12---sn-gvnuxaxjvh-bvwz.googlevideo.com",
        "rr5---sn-n8v7knez.googlevideo.com",
        "rr1---sn-u5uuxaxjvhg0-ocje.googlevideo.com",
        "rr2---sn-q4fl6ndl.googlevideo.com",
        "rr5---sn-gvnuxaxjvh-n8vk.googlevideo.com",
        "rr4---sn-jvhnu5g-c35d.googlevideo.com",
        "rr1---sn-q4fl6n6y.googlevideo.com",
        "rr2---sn-hgn7ynek.googlevideo.com",
        "rr1---sn-xguxaxjvh-gufl.googlevideo.com"
    ]
}

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

// MARK: - State

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

// MARK: - Views

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

// MARK: - App Entry

@main
struct BBDpiApp: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
