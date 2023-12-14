// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "SwiftWrapper",
  products: [
    .library(
      name: "SwiftWrapper",
      targets: ["SwiftWrapper"])
  ],
  targets: [
    .binaryTarget(
      name: "RustCore",
      path: "../RustCore/target/RustCore.xcframework"),
    .target(
      name: "SwiftWrapper",
      dependencies: ["RustCore"]),
    .testTarget(
      name: "SwiftWrapperTests",
      dependencies: ["SwiftWrapper"]),
  ]
)
