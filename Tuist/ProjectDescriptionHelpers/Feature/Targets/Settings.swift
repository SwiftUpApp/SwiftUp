import ProjectDescription

struct Settings {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.coreDependencies = [
                .swiftUpKit,
                .swiftUpUI
            ]
            $0.thirdPartyDependencies = [.composableArchitecture]
        }
        .build(name: "Settings",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".settings",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
}
