// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AccountUI",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AccountUI",
            targets: ["AccountUI"]),
    ],
    dependencies: [
        .package(path: "../../libraries/Core"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AccountUI",
            dependencies: ["Core"],
            path: "Sources/AccountUI"),
        .testTarget(
            name: "AccountUITests",
            dependencies: ["AccountUI"]
        ),
    ]
)
