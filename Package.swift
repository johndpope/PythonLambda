// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PythonLambda",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
//        .library(
//            name: "PythonLambdaSupport", // provides C-based interface to Python
//            targets: ["PythonLambdaSupport"]),
        .library(
            name: "PythonLambda",
            targets: ["PythonLambda"]),
    ],
    dependencies: [
     //   .package(url: "https://github.com/pvieito/PythonKit.git", .branch("master")),
     //   .package(path: "../../PythonKit")
        .package(url:"https://github.com/jrsonline/PythonKit.git",.branch("py_c_tools"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "libpylamsupport",
            dependencies: []
        ),
//        .target(
//            name: "PythonLambdaSupport",
//            dependencies: ["libpylamsupport"]
//        ),
        .target(
            name: "PythonLambda",
            dependencies:[  "libpylamsupport" , "PythonKit"]
        ),
        .testTarget(
            name: "PythonLambdaTests",
            dependencies: ["PythonLambda", "PythonKit"]
        )
    ]
)
