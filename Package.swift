// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NESDeltaCore",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12),
        .macOS(.v11),
        .tvOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NESDeltaCore",
            targets: ["NESDeltaCore"]),
        .library(
            name: "NESDeltaCoreStatic",
            type: .static,
            targets: ["NESDeltaCore"]),
        .library(
            name: "NESDeltaCoreDynamic",
            type: .dynamic,
            targets: ["NESDeltaCore"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
//        .package(url: "https://github.com/rileytestut/DeltaCore.git", .branch("main"))
        .package(path: "../DeltaCore")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "NESDeltaCore",
            dependencies: [
                .product(name: "DeltaCore", package: "DeltaCore"),
                .product(name: "DeltaTypes", package: "DeltaCore"),
                "nestopia",
                "NestopiaJS"],
            exclude: [
                "Resources/Controller Skin/info.json",
                "Resources/Controller Skin/ipad_landscape.pdf",
                "Resources/Controller Skin/ipad_landscape_large.png",
                "Resources/Controller Skin/ipad_landscape_medium.png",
                "Resources/Controller Skin/ipad_landscape_small.png",
                "Resources/Controller Skin/ipad_portrait_large.png",
                "Resources/Controller Skin/ipad_portrait_medium.png",
                "Resources/Controller Skin/ipad_portrait_small.png",
                "Resources/Controller Skin/iphone_edgetoedge_landscape.pdf",
                "Resources/Controller Skin/iphone_edgetoedge_portrait.pdf",
                "Resources/Controller Skin/iphone_landscape.pdf",
                "Resources/Controller Skin/iphone_portrait.pdf"
            ],
            resources: [
                .copy("Resources/Controller Skin/Standard.deltaskin"),
                .copy("Resources/Standard.deltamapping"),
            ],
            publicHeadersPath: "include"
        ),
        .target(
            name: "NestopiaJS",
            dependencies: [],
            sources: [
                "NESEmulatorBridge.cpp"
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("../nestopia/nestopia/source/core/"),
                .headerSearchPath("../nestopia/nestopia/source/core/api")
            ],
            cxxSettings: [
                .headerSearchPath("../nestopia/nestopia/source/core/"),
                .headerSearchPath("../nestopia/nestopia/source/core/api")
            ]
        ),
        .target(
            name: "nestopia",
            exclude: [
                "nestopia/doc",
                "nestopia/extras",
                "nestopia/libretro",
                "nestopia/source/nes_ntsc/",
                "nestopia/source/nes_ntsc/tests/",
                "nestopia/source/unix/audio.cpp",
                "nestopia/source/unix/cheats.cpp",
                "nestopia/source/unix/cli.cpp",
                "nestopia/source/unix/config.cpp",
                "nestopia/source/unix/cursor.cpp",
                "nestopia/source/unix/ini.cpp",
                "nestopia/source/unix/input.cpp",
                "nestopia/source/unix/main.cpp",
                "nestopia/source/unix/png.cpp",
                "nestopia/source/unix/video.cpp",
                "nestopia/source/unix/gtkui/",
                "nestopia/source/unix/icons/",
                "nestopia/AUTHORS",
                "nestopia/CMakeLists.txt",
                "nestopia/COPYING",
                "nestopia/ChangeLog",
                "nestopia/Makefile.am",
                "nestopia/NstDatabase.xml",
                "nestopia/README.md",
                "nestopia/configure.ac",
                "nestopia/readme.html",
                "nestopia/schemadb.xsd",
                "nestopia/schemaromset.xsd",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("nestopia/source/core")
            ],
            cxxSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("nestopia/source/core")
            ]
        )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)
