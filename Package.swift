// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "S3DBaseGallery",
    platforms: [
           .iOS(.v15), // Set the minimum iOS version to 16
           .macOS(.v10_15)
       ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "S3DBaseGallery",
            targets: ["S3DBaseGallery"]),
    ],
    dependencies: [
        .package(url:"https://github.com/hassanvfx/s3d-coremodels.git", .upToNextMajor(from: "0.0.5")),
        .package(url:"https://github.com/hassanvfx/s3d-coreui.git", .upToNextMajor(from: "0.0.9")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "S3DBaseGallery",
            dependencies: [
                .product(name: "S3DCoreModels", package: "s3d-coremodels"),
                .product(name: "S3DCoreUI", package: "s3d-coreui"),
            ]),
        .testTarget(
            name: "S3DBaseGalleryTests",
            dependencies: ["S3DBaseGallery"]),
    ]
)
