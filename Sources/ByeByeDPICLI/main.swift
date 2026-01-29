import ByeByeDPI
import Foundation

let selector = CommandSelector()
let strategyArg = CommandLine.arguments.dropFirst().first ?? "balanced"
let routeArg = CommandLine.arguments.dropFirst(2).first ?? "split"

let strategy = DpiStrategy(rawValue: strategyArg) ?? .balanced
let route = RoutePolicy(rawValue: routeArg) ?? .splitTunnel

let profile = selector.makeProfile(for: strategy, routePolicy: route)
let config = VpnConfiguration(
    profile: profile,
    serverAddress: "127.0.0.1",
    mtu: 1500,
    dnsServers: ["1.1.1.1", "8.8.8.8"]
)

print("Profile: \(profile.name)")
print("Description: \(profile.description)")
print("Command Preview:")
print(config.commandPreview)
print("\nSteps:")
print(CommandFormatter().format(plan: profile.commandPlan))
