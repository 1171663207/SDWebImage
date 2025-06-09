// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MyPrefixSDWebImageDynamic", // 添加前缀到包名
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "MyPrefixSDWebImageDynamic", // 添加前缀到主产品名
            type: .dynamic,
            targets: ["MyPrefixSDWebImageDynamic"]
        ),
        .library(
            name: "MyPrefixSDWebImageMapKitDynamic", // 添加前缀到 MapKit 产品名
            type: .dynamic,
            targets: ["MyPrefixSDWebImageMapKitDynamic"]
        )
    ],
    targets: [
        .target(
            name: "MyPrefixSDWebImageDynamic", // 添加前缀到目标名
            path: "SDWebImage",
            sources: ["Core", "Private"],
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")],
            cSettings: [
                .headerSearchPath("Core"),
                .headerSearchPath("Private")
            ]
        ),
        .target(
            name: "MyPrefixSDWebImageMapKitDynamic", // 添加前缀到目标名
            dependencies: [
                "MyPrefixSDWebImageDynamic", // 依赖本地动态库
            ],
            path: "SDWebImageMapKit",
            sources: ["MapKit"],
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")]
        )
    ]
)
