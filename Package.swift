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
            url: "https://github.com/thisisommore/xxdk-spm/releases/download/0.0.3/Bindings.xcframework.zip",
            checksum: "650ff8a9fcac5dbef65e43ab9ad53a780ab4e45561a472ac7a3ff0067406b2d7"
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
