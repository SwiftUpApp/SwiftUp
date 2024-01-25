import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "SwiftUp",
    packages: ThirdParty.allCases.map(\.package),
    targets: App.allCases.map(\.target)
                + Core.allCases.map(\.target)
                + Feature.allCases.map(\.target)
                + ThirdParty.allCases.map(\.target),
    schemes: [
        .default(
            named: "SwiftUp",
            buildTarget: App.swiftUpApp.target,
            runConfiguration: Configurations.debug.configuration,
            archiveConfiguration: Configurations.release.configuration)])
