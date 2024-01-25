import ProjectDescription

struct Speakers: Module {
    let path: String
    
    var mainTarget: Target {
        FrameworkBuilder {
            $0.coreDependencies = [
                .swiftUpKit,
                .swiftUpUI
            ]
            $0.thirdPartyDependencies = [.composableArchitecture]
        }
        .build(name: "Speakers",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".speakers",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
    
    var allTargets: [Target] {
        [mainTarget]
    }
}
