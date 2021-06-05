// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "HigherOrderFunctionObjC",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_11),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "HigherOrderFunctionObjC", 
            targets: ["HigherOrderFunctionObjC"]
        )
    ],
    targets: [
        .target(
            name: "HigherOrderFunctionObjC", 
            path: "Higher-Order-Function-ObjC", 
            exclude: [
                "ExampleUsages.h",
                "ExampleUsages.m",
                "main.m"
            ],
            publicHeadersPath: ""
        )
    ]
)
