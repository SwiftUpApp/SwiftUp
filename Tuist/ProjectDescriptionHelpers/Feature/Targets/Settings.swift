import ProjectDescription

struct Settings: Module {
    let path: String
    
    var mainTarget: Target {
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
    
    var allTargets: [Target] {
        [mainTarget]
    }
}
