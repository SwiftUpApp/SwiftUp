import ProjectDescription

struct Dashboard {
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
        .build(name: "Dashboard",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".dashboard",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
}
