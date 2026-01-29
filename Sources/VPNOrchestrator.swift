import Foundation

public protocol VPNOrchestrating {
    func prepareTunnel(arguments: [String]) throws
    func startTunnel() throws
    func stopTunnel() throws
}

public enum VPNError: Error {
    case notImplemented
}

public struct VPNOrchestrator: VPNOrchestrating {
    public init() {}

    public func prepareTunnel(arguments: [String]) throws {
        _ = arguments
        throw VPNError.notImplemented
    }

    public func startTunnel() throws {
        throw VPNError.notImplemented
    }

    public func stopTunnel() throws {
        throw VPNError.notImplemented
    }
}
