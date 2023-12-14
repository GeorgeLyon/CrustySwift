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
    .target(name: "Schemas"),
    .target(
      name: "SwiftWrapper",
      dependencies: ["RustCore", "Schemas"]),
    .testTarget(
      name: "SwiftWrapperTests",
      dependencies: ["SwiftWrapper"]),
  ]
)
