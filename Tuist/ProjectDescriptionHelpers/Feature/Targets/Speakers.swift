import ProjectDescription

struct Speakers {
    let path: String
    
    var target: ProjectDescription.Target {
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
}
