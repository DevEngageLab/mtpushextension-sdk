// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MTPushExtension",
    platforms: [.iOS(.v10)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MTPushExtension",
            targets: ["MTPushExtensionWrapper"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.

        .target(
            name: "MTPushExtensionWrapper",
            dependencies: ["MTPushExtension"], 
            path: "MTPushExtensionWrapper",
            linkerSettings: [ 
                .linkedLibrary("z"),
                .linkedLibrary("resolv"),
                .linkedFramework("UIKit"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("Foundation"),
                .linkedFramework("Security"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("UserNotifications")
            ]
        ),
        .binaryTarget(
            name: "MTPushExtension", 
            path: "mtpush-extension-ios-4.3.8.xcframework"
        ),
    ]
)
