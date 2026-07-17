// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XXDK",
    platforms: [.iOS(.v17),.macOS(.v26)],
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
            url: "https://github.com/thisisommore/xxdk-spm/releases/download/0.0.4/Bindings.xcframework.zip",
            checksum: "4dbb63c11521e5765889d1ed9f78b76a04433ed72c1ee7f403a778a0953b3119"
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
