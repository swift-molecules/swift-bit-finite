// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-bit-finite-primitives",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Bit Finite Primitives",
            targets: ["Bit Finite Primitives"]
        ),
        .library(
            name: "Bit Finite Primitives Test Support",
            targets: ["Bit Finite Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-primitives/swift-bit-primitives.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-primitives/swift-finite-primitives.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-primitives/swift-cardinal-primitives.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-primitives/swift-ordinal-primitives.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Bit Finite Primitives",
            dependencies: [
                .product(name: "Bit Primitive", package: "swift-bit-primitives"),
                .product(
                    name: "Bit Primitives Standard Library Integration",
                    package: "swift-bit-primitives"
                ),
                .product(name: "Finite Enumerable Primitives", package: "swift-finite-primitives"),
                .product(name: "Cardinal Primitives", package: "swift-cardinal-primitives"),
                .product(name: "Ordinal Primitives", package: "swift-ordinal-primitives"),
            ]
        ),
        .target(
            name: "Bit Finite Primitives Test Support",
            dependencies: [
                "Bit Finite Primitives"
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Bit Finite Primitives Tests",
            dependencies: [
                "Bit Finite Primitives",
                "Bit Finite Primitives Test Support",
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
