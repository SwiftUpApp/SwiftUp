import Bootstrap
import ProjectDescription

struct Splash: TargetConvertible {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.dependencies = [
                Core.swiftUpKit.dependency,
                Core.swiftUpUI.dependency,
                ThirdParty.composableArchitecture.dependency
            ]
        }
        .build(name: "Splash",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".splash",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
}
