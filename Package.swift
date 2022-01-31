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
    dependencies: [],
    targets: [
      .target(
        name: "SwiftUIExtensions",
        dependencies: []
      ),
      // NOTE: Re-enable when tests are added.
//      .testTarget(
//        name: "SwiftUIExtensionsTests",
//        dependencies: ["SwiftUIExtensions"]
//      ),
    ]
  )
