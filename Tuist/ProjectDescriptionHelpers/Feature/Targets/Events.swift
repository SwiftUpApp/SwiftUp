import ProjectDescription

struct Events: Module {
    let path: String
    
    var mainTarget: Target {
        FrameworkBuilder {
            $0.coreDependencies = [
                .swiftUpKit,
                .swiftUpUI
            ]
            $0.featureDependencies = [
                .meetupDetails
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
    
    var allTargets: [Target] {
        [mainTarget, unitTestsTarget]
    }
    
    private var unitTestsTarget: Target {
        .unitTests(
            of: mainTarget,
            destinations: mainTarget.destinations,
            sources: ["\(path)/Tests/**"],
            thirdPartyDependencies: [
                .composableArchitecture
            ])
    }
}
