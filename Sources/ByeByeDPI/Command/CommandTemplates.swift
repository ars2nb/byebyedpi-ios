import Foundation

public struct CommandTemplates {
    public static func baseArguments(mutation: MutationPlan) -> [String] {
        [
            "--ttl",
            String(mutation.ttl),
            "--window-size",
            String(mutation.windowSize),
            "--split",
            String(mutation.splitCount),
            "--pad",
            String(mutation.paddingBytes)
        ]
    }

    public static func desyncArguments(mode: String) -> [String] {
        ["--dpi-desync", mode]
    }

    public static func layer7Arguments() -> [String] {
        ["--disable-keepalive", "--host-case"]
    }

    public static func tlsArguments() -> [String] {
        ["--tls-padding", "128", "--tls-record-split", "1"]
    }

    public static func httpArguments() -> [String] {
        ["--http-method", "GET", "--http-spacing", "mixed"]
    }
}
