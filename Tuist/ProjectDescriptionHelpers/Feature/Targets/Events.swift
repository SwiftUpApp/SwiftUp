import ProjectDescription

struct Events {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.coreDependencies = [
                .swiftUpKit,
                .swiftUpUI
            ]
            $0.thirdPartyDependencies = [
                .composableArchitecture
            ]
        }
        .build(name: "Events",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".events",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
}
