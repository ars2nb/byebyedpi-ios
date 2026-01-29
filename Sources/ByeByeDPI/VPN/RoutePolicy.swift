import Foundation

public enum RoutePolicy: String, Codable, CaseIterable {
    case fullTunnel
    case splitTunnel

    public var displayName: String {
        switch self {
        case .fullTunnel:
            return "Full tunnel"
        case .splitTunnel:
            return "Split tunnel"
        }
    }

    public var arguments: [String] {
        switch self {
        case .fullTunnel:
            return ["--route", "all"]
        case .splitTunnel:
            return ["--route", "split"]
        }
    }
}
