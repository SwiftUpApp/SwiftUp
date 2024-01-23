import Bootstrap
import ProjectDescription

struct Settings: TargetConvertible {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.dependencies = [
                Core.swiftUpKit.dependency,
                Core.swiftUpUI.dependency,
                ThirdParty.composableArchitecture.dependency
            ]
        }
        .build(name: "Settings",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".settings",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
}
