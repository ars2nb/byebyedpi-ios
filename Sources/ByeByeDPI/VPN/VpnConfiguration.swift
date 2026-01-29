import Foundation

public struct VpnConfiguration: Hashable, Codable {
    public var profile: DpiProfile
    public var serverAddress: String
    public var mtu: Int
    public var dnsServers: [String]

    public init(profile: DpiProfile, serverAddress: String, mtu: Int, dnsServers: [String]) {
        self.profile = profile
        self.serverAddress = serverAddress
        self.mtu = mtu
        self.dnsServers = dnsServers
    }

    public var commandPreview: String {
        let steps = profile.commandPlan.steps.flatMap { $0.arguments }
        let args = (["byedpi"] + steps + ["--mtu", String(mtu), "--server", serverAddress])
        return args.joined(separator: " ")
    }
}
