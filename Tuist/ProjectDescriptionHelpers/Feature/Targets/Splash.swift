import ProjectDescription

struct Splash: Module {
    let path: String
    
    var mainTarget: Target {
        FrameworkBuilder {
            $0.coreDependencies = [
                .swiftUpKit,
                .swiftUpUI
            ]
            $0.featureDependencies = [.tabs]
            $0.thirdPartyDependencies = [.composableArchitecture]
        }
        .build(name: "Splash",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".splash",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
    
    var allTargets: [Target] {
        [mainTarget]
    }
}
