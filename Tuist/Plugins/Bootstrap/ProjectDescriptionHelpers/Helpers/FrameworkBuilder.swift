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
                      destinations: Destinations,
                      bundleID: String,
                      sources: SourceFilesList,
                      deploymentTargets: DeploymentTargets) -> Target {
        Target(
            name: name,
            destinations: destinations,
            product: .framework,
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
