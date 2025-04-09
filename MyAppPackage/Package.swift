// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyAppPackage",
    // SwiftPM上でSwiftUIを利用するために必要
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "MyAppPackage", targets: ["MyAppPackage"]),
    ],
    // OSSを利用する。productsの真下に指定が必要
    dependencies: [
        .package(url: "https://github.com/YusukeHosonuma/SwiftPrettyPrint.git", from: "1.4.0"),
        .package(url: "https://github.com/tony1224/SwiftUIWorkshop.git", from: "1.3.0"),
        .package(url: "https://github.com/tony1224/SwiftAPIClient.git", from: "1.0.4"),
        .package(path: "../features/LoginUI"),
        .package(path: "../features/SettingsUI"),
        .package(path: "../features/AccountUI"),
        .package(path: "../libraries/Core"),
    ],
    targets: [
        .target(name: "MyAppPackage",
                dependencies: ["SwiftPrettyPrint", "SwiftUIWorkshop", "SwiftAPIClient", "Core", "LoginUI", "SettingsUI", "AccountUI"]),
    ]
)