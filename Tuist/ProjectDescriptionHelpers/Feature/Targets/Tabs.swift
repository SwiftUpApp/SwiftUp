import Bootstrap
import ProjectDescription

struct Tabs: TargetConvertible {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.dependencies = [
                Core.swiftUpKit.dependency,
                Core.swiftUpKit.dependency,
                ThirdParty.composableArchitecture.dependency
            ]
        }
        .build(name: "Tabs",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".tabs",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
}

