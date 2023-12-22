import ProjectDescription

public final class AppBuilder {
    public var infoPlist: InfoPlist?
    public var sources: SourceFilesList?
    public var resources: ResourceFileElements?
    public var dependencies: [TargetDependency] = []
    public var settings: Settings?
    
    public init(with configure: ((inout AppBuilder) -> Void)) {
        var this = self
        configure(&this)
    }
    
    public func build(name: String,
                      bundleID: String,
                      deploymentTarget: DeploymentTarget) -> Target {
        Target(
            name: name,
            platform: deploymentTarget.platform,
            product: .app,
            productName: name,
            bundleId: bundleID,
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies,
            settings: settings)
    }
}
