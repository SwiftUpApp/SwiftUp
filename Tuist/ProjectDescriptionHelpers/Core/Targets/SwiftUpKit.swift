import ProjectDescription

struct SwiftUpKit: Module {
    let path: String
    
    var mainTarget: Target {
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
    
    var allTargets: [Target] {
        [mainTarget]
    }
}
