// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "OpenCombine",
    products: [
        .library(name: "OpenCombine", targets: ["OpenCombine"]),
        .library(name: "OpenCombineDispatch", targets: ["OpenCombineDispatch"]),
    ],
    targets: [
        .target(name: "COpenCombineHelpers", cxxSettings: [.headerSearchPath(".")]),
        .target(name: "OpenCombine", dependencies: ["COpenCombineHelpers"]),
        .target(name: "OpenCombineDispatch", dependencies: ["OpenCombine"]),
        .testTarget(name: "COpenCombineHelpersTests",
                    dependencies: ["COpenCombineHelpers"],
                    swiftSettings: [.unsafeFlags(["-enable-testing"])]),
        .testTarget(name: "OpenCombineTests",
                    dependencies: ["OpenCombine",
                                   "OpenCombineDispatch"],
                    swiftSettings: [.unsafeFlags(["-enable-testing"])])
    ],
    cxxLanguageStandard: .cxx14
)
