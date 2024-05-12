// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SecretStore",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SecretStore",
            targets: ["SecretStore"]),
    ],
    dependencies: [
      .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
      .package(path: "ArchTool"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SecretStore",
            dependencies: ["Swinject", "ArchTool"]
        ),
        .testTarget(
            name: "SecretStoreTests",
            dependencies: ["SecretStore"]),
    ]
)
