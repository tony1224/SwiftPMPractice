// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoginUI",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LoginUI",
            targets: ["LoginUI"]),
    ],
    dependencies: [
        .package(path: "../../libraries/Core"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LoginUI",
            dependencies: ["Core"],
            path: "Sources/LoginUI"
        ),
        .testTarget(
            name: "LoginUITests",
            dependencies: ["LoginUI"]
        ),
    ]
)
