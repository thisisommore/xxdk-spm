// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XXDK",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Bindings",
            targets: ["XXDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "Bindings",
            url: "https://github.com/thisisommore/xxdk-spm/releases/download/0.0.2/Bindings.xcframework.zip",
            checksum: "7248ef90a4b807359b291b6c7a2f7821945e6907a2ceb989aa9013b11b2cd41a"
        ),
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "XXDK",
            dependencies: ["Bindings"],
            linkerSettings: [.linkedLibrary("resolv.9")]
        ),
        .testTarget(
            name: "XXDKTests",
            dependencies: ["XXDK"]
        ),
    ]
)
