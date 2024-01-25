import ProjectDescription

struct Tabs {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.coreDependencies = [
                .swiftUpKit,
                .swiftUpUI
            ]
            $0.featureDependencies = [
                .dashboard,
                .events,
                .speakers,
                .settings
            ]
            $0.thirdPartyDependencies = [.composableArchitecture]
        }
        .build(name: "Tabs",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".tabs",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
}

