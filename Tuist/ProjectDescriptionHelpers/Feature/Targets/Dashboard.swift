import Bootstrap
import ProjectDescription

struct Dashboard: TargetConvertible {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.dependencies = [
                Core.swiftUpKit.dependency,
                Core.swiftUpUI.dependency,
                ThirdParty.composableArchitecture.dependency
            ]
        }
        .build(name: "Dashboard",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".dashboard",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
}
