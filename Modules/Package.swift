// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Modules",
            targets: ["Modules"]),
    ],
    dependencies: [
      .package(path: "Authorization"),
      .package(path: "ArchTool"),
      .package(path: "CDFoundation"),
      .package(path: "Place"),
      .package(path: "SecretStore"),
      .package(path: "Game"),
      .package(path: "User"),
      .package(path: "Map"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Modules",
            dependencies: ["Authorization", "ArchTool", "CDFoundation", "Place", "SecretStore", "Game", "User", "Map"]),
        .testTarget(
            name: "ModulesTests",
            dependencies: ["Modules"]),
    ]
)
