import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    swiftPackageManager: .init(
        productTypes: ["ComposableArchitecture": .framework]),
    platforms: .init([.iOS])
)
