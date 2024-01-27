import ProjectDescription

struct Localization: Module {
    let path: String
    
    var mainTarget: Target {
        FrameworkBuilder {
            $0.resources = ["\(path)/Resources/**"]
        }
        .build(name: "Localization",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".localization",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget)
    }
    
    var allTargets: [Target] {
        [mainTarget]
    }
}
