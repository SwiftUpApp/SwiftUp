import ProjectDescription

public final class FrameworkBuilder {
    public var infoPlist: InfoPlist = .default
    public var resources: ResourceFileElements?
    public var dependencies: [TargetDependency] = []
    public var settings: Settings?
    
    public init(with configure: ((inout FrameworkBuilder) -> Void)) {
        var this = self
        configure(&this)
    }
    
    public func build(name: String,
                      bundleID: String,
                      sources: SourceFilesList,
                      deploymentTarget: DeploymentTarget) -> Target {
        Target(
            name: name,
            platform: deploymentTarget.platform,
            product: .framework,
            bundleId: bundleID,
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies,
            settings: settings)
    }
}
