import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "SwiftUp",
    packages: ThirdParty.allCases.map(\.package),
    targets: App.allCases.map(\.target)
                + Core.allCases.flatMap(\.module.allTargets)
                + Feature.allCases.flatMap(\.module.allTargets)
                + ThirdParty.allCases.map(\.mainTarget),
    schemes: [
        .default(
            named: "SwiftUp",
            buildTarget: App.swiftUpApp.target,
            runConfiguration: Configurations.debug.configuration,
            archiveConfiguration: Configurations.release.configuration)])
