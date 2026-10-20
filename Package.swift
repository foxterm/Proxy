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
        .package(url: "https://github.com/foxterm/libetos.git", branch: "main"),
        .package(url: "https://github.com/foxterm/Extension.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Proxy",
            dependencies: ["libetos", "Extension"]
        ),
    ]
)
