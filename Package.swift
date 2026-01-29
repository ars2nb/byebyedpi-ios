// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ByeByeDPI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "ByeByeDPI", targets: ["ByeByeDPI"])
    ],
    targets: [
        .target(
            name: "ByeByeDPI",
            path: "Sources"
        ),
        .testTarget(
            name: "ByeByeDPITests",
            dependencies: ["ByeByeDPI"],
            path: "Tests"
        )
    ]
)
