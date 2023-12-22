import Bootstrap
import ProjectDescription

struct SwiftUpKit: TargetConvertible {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.dependencies = [
                ThirdParty.composableArchitecture.dependency
            ]
        }
        .build(name: "SwiftUpKit",
               bundleID: Global.bundleID + ".swiftUpKit",
               sources: ["\(path)/Sources/**"],
               deploymentTarget: Global.deploymentTarget)
    }
}
