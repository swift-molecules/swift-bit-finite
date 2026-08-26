// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-bit-finite",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Bit Finite",
            targets: ["Bit Finite"]
        ),
        .library(
            name: "Bit Finite Test Support",
            targets: ["Bit Finite Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-bit.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-finite.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-cardinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-ordinal.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Bit Finite",
            dependencies: [
                .product(name: "Bit Primitive", package: "swift-bit"),
                .product(
                    name: "Bit Standard Library Integration",
                    package: "swift-bit"
                ),
                .product(name: "Finite Enumerable", package: "swift-finite"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
            ]
        ),
        .target(
            name: "Bit Finite Test Support",
            dependencies: [
                "Bit Finite"
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Bit Finite Tests",
            dependencies: [
                "Bit Finite",
                "Bit Finite Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
