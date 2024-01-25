import ProjectDescription

struct Dashboard: Module {
    let path: String
    
    var mainTarget: Target {
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
    
    var allTargets: [Target] {
        [mainTarget]
    }
}
