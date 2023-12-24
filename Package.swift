// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SoliticsMasterPackage",
    products: [
        .library(name: "SoliticsSwiftPackage", targets: ["SoliticsMasterPackage"])
    ],
    dependencies: [
      .package(id: "swift.solitics", exact: "1.0.4")
    ],
    targets: [
        .target(name: "SoliticsMasterPackage", dependencies: [
          .product(name: "SoliticsPackage", package: "swift.solitics")
        ])
    ]
)
