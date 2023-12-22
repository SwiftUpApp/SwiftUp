import Bootstrap
import ProjectDescription

struct SwiftUpUI: TargetConvertible {
    let path: String
    
    var target: ProjectDescription.Target {
        FrameworkBuilder {
            $0.dependencies = [
                ThirdParty.composableArchitecture.dependency
            ]
            $0.resources = ["\(path)/Resources/**/*"]
        }
        .build(name: "SwiftUpUI",
               bundleID: Global.bundleID + ".SwiftUpUI",
               sources: ["\(path)/Sources/**"],
               deploymentTarget: Global.deploymentTarget)
    }
}
