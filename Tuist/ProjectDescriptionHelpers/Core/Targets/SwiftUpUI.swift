import ProjectDescription

struct SwiftUpUI: Module {
    let path: String
    
    var mainTarget: Target {
        FrameworkBuilder {
            $0.coreDependencies = [
                .swiftUpKit
            ]
            $0.thirdPartyDependencies = [
                .composableArchitecture
            ]
            $0.resources = ["\(path)/Resources/**/*"]
        }
        .build(name: "SwiftUpUI",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".SwiftUpUI",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget)
    }
    
    var allTargets: [Target] {
        [mainTarget]
    }
}
