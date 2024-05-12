// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Place",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Place",
            targets: ["Place"]),
    ],
    dependencies: [
      .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
      .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
      .package(path: "CDUIKit"),
      .package(path: "Networking"),
      .package(path: "CDFoundation")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Place",
            dependencies: ["Swinject", "CDUIKit", "SnapKit", "Networking", "CDFoundation"]
        ),
        .testTarget(
            name: "PlaceTests",
            dependencies: ["Place"]),
    ]
)
