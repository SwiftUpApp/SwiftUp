import ProjectDescription

struct SwiftUpUI {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
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
}
