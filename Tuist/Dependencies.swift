import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    swiftPackageManager: .init(
        ThirdParty.allCases.map(\.externalSource.package),
        productTypes: ["ComposableArchitecture": .framework]),
    platforms: [Global.deploymentTarget.platform]
)