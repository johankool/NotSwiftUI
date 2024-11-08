// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NotSwiftUI",
    platforms: [.macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NotSwiftUI",
            targets: ["NotSwiftUI"]),
        .library(name: "NotSwiftUIShim", targets: ["NotSwiftUIShim"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.14.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "NotSwiftUI",
            dependencies: [
                .product(name: "OpenCombineShim", package: "OpenCombine"),
                .product(name: "OpenCombineFoundation", package: "OpenCombine"),
                .product(name: "OpenCombineDispatch", package: "OpenCombine")
                
            ]),
        .testTarget(
            name: "NotSwiftUITests",
            dependencies: [
                "NotSwiftUI",
                .product(name: "OpenCombineShim", package: "OpenCombine"),
                .product(name: "OpenCombineFoundation", package: "OpenCombine"),
                .product(name: "OpenCombineDispatch", package: "OpenCombine")
            ]),
        .target(
            name: "NotSwiftUIShim",
            dependencies: [
                "NotSwiftUI"
            ]
        ),
    ]
)
