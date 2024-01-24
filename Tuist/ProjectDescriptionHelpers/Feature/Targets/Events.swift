import Bootstrap
import ProjectDescription

struct Events: TargetConvertible {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.dependencies = [
                Core.swiftUpKit.dependency,
                Core.swiftUpUI.dependency,
                ThirdParty.composableArchitecture.dependency
            ]
        }
        .build(name: "Events",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".events",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
}
