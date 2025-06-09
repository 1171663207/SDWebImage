// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDWebImage_Dynamic",
    platforms: [
        .macOS(.v10_11),
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SDWebImage_Dynamic",
            type: .dynamic,
            targets: ["SDWebImage_Dynamic"]),
        .library(
            name: "SDWebImageMapKit_Dynamic",
            type: .dynamic,
            targets: ["SDWebImageMapKit_Dynamic"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SDWebImage_Dynamic",
            dependencies: [],
            path: "SDWebImage",
            sources: ["Core", "Private"],
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")],
            cSettings: [
                .headerSearchPath("Core"),
                .headerSearchPath("Private")
            ]
        ),
        .target(
            name: "SDWebImageMapKit_Dynamic",
            dependencies: ["SDWebImage_Dynamic"],
            path: "SDWebImageMapKit",
            sources: ["MapKit"],
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")]
        )
    ]
)
