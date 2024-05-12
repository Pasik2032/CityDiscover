// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Authorization",
    platforms: [.iOS(.v15)],
    products: [
      // Products define the executables and libraries a package produces, making them visible to other packages.
      .library(
        name: "Authorization",
        targets: ["Authorization"]),
    ],
    dependencies: [
      .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
      .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
      .package(path: "CDUIKit"),
      .package(path: "Networking"),
      .package(path: "ArchTool"),
      .package(url: "https://github.com/auth0/JWTDecode.swift.git", from: "3.0.0"),
      .package(path: "SecretStore"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Authorization",
            dependencies: ["Swinject", "CDUIKit", "SnapKit", "Networking", "ArchTool", "SecretStore", .product(name: "JWTDecode", package: "JWTDecode.swift")]
        ),
        .testTarget(
            name: "AuthorizationTests",
            dependencies: ["Authorization"]),
    ]
)
