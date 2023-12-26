// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
///
///
///
let package = Package(name: "SoliticsPackage")
package.swiftLanguageVersions = [.v5]
package.platforms   = [
    .iOS(.v12),
]
package.products    = [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(name: "SoliticsLibrary", targets: ["SoliticsPackage"])
]
package.dependencies = [
    .package(id: "swift.solitics", from: "2.2.0")
]
package.targets     = [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(name: "SoliticsPackage", dependencies: [
        .product(name: "SoliticsWrapper", package: "swift.solitics")
    ])
]
