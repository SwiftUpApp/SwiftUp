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
                      destinations: Destinations,
                      bundleID: String,
                      deploymentTargets: DeploymentTargets) -> Target {
        Target(
            name: name,
            destinations: destinations,
            product: .app,
            bundleId: bundleID,
            deploymentTargets: deploymentTargets,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies,
            settings: settings
        )
    }
}
