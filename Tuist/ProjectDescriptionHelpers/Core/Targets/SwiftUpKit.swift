import ProjectDescription

struct SwiftUpKit {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.thirdPartyDependencies = [
                .composableArchitecture
            ]
        }
        .build(name: "SwiftUpKit",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".swiftUpKit",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget)
    }
}
