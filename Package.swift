// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Proxy",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "Proxy", targets: ["Proxy"]),
    ],
    dependencies: [
        .package(url: "https://github.com/foxterm/libetos.git", from: "1.0.9"),
        .package(url: "https://github.com/foxterm/Extension.git", from: "1.0.9"),
    ],
    targets: [
        .target(
            name: "Proxy",
            dependencies: [
                .product(name: "libetos", package: "libetos"),
                .product(name: "Extension", package: "Extension"),
            ]
        ),
    ]
)
