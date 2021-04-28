// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BotStopper",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "BotStopper",
            targets: ["BotStopper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.44.0")
    ],
    targets: [
        .target(
            name: "BotStopper",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]),
        .testTarget(
            name: "BotStopperTests",
            dependencies: ["BotStopper"]),
    ]
)
