// swift-tools-version:5.5
import PackageDescription

let package =
  Package(
    name: "SwiftUIExtensions",
    platforms: [
      .iOS(.v15),
      .watchOS(.v8),
      .macOS(.v12),
    ],
    products: [
      .library(
        name: "SwiftUIExtensions",
        targets: ["SwiftUIExtensions"]
      ),
    ],
    dependencies: [
      .package(name: "SwiftFoundationExtensions", url: "https://github.com/xiiagency/SwiftFoundationExtensions", .branchItem("main")),
    ],
    targets: [
      .target(
        name: "SwiftUIExtensions",
        dependencies: [
          "SwiftFoundationExtensions",
        ]
      ),
      // NOTE: Re-enable when tests are added.
//      .testTarget(
//        name: "SwiftUIExtensionsTests",
//        dependencies: ["SwiftUIExtensions"]
//      ),
    ]
  )
