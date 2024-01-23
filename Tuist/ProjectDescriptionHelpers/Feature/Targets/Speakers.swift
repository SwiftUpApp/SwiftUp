import Bootstrap
import ProjectDescription

struct Speakers: TargetConvertible {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.dependencies = [
                Core.swiftUpKit.dependency,
                Core.swiftUpUI.dependency,
                ThirdParty.composableArchitecture.dependency
            ]
        }
        .build(name: "Speakers",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".speakers",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget
        )
    }
}
