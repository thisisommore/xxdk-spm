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
            url: "https://github.com/thisisommore/xxdk-spm/releases/download/v0.0.1/Bindings.xcframework.zip",
            checksum: "f677149ade5090c468f9068813ff354e62c82545d70687454dfe5dbe985bbc9d"
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
