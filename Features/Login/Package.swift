// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Login",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Login",
            targets: ["Login"]),
    ],
    dependencies: [
        .package(path: "../Core/CommonUI"),
        .package(path: "../Foundation/Network"),
        .package(path: "../Foundation/Router"),
        .package(path: "../Foundation/Domain"),
        .package(path: "../Foundation/Helpers"),
        .package(path: "../SystemDesign"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Login",
            dependencies: [
                "Network",
                "CommonUI",
                "Router",
                "Domain",
                "Helpers",
                "SystemDesign",
                .product(name: "DomainData", package: "Domain"),
            ]
        ),
        .testTarget(
            name: "LoginTests",
            dependencies: ["Login",
            .product(name: "NetworkMock", package: "Network"),
        ]),
    ]
)
