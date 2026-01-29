// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ByeByeDPI",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(name: "ByeByeDPI", targets: ["ByeByeDPI"]),
        .executable(name: "byebyedpi-cli", targets: ["ByeByeDPICLI"])
    ],
    targets: [
        .target(name: "ByeByeDPI"),
        .executableTarget(
            name: "ByeByeDPICLI",
            dependencies: ["ByeByeDPI"]
        ),
        .testTarget(name: "ByeByeDPITests", dependencies: ["ByeByeDPI"])
    ]
)
