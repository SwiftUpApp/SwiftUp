import ProjectDescription

struct Splash {
    let path: String
    
    var target: ProjectDescription.Target {
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
}
