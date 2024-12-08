// swift-tools-version:5.9
import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers


let packageSetting = PackageSettings(
    baseSettings: .settings(
        configurations: [
            .debug(name: .dev),
            .release(name: .prod)
        ]
    )
)
#endif

let package = Package(
    name: "Package",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.7.0"),
        .package(url: "https://github.com/layoutBox/FlexLayout.git", from: "2.0.10"),
        .package(url: "https://github.com/layoutBox/PinLayout", from: "1.10.5")
    ]
)

