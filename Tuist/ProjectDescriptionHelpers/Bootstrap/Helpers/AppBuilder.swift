import ProjectDescription

public final class AppBuilder {
    public var infoPlist: InfoPlist?
    public var sources: SourceFilesList?
    public var resources: ResourceFileElements?
    public var featureDependencies: [Feature] = []
    public var coreDependencies: [Core] = []
    public var thirdPartyDependencies: [ThirdParty] = []
    public var settings: ProjectDescription.Settings?
    
    public init(with configure: ((inout AppBuilder) -> Void)) {
        var this = self
        configure(&this)
    }
    
    public func build(name: String,
                      destinations: Destinations,
                      bundleID: String,
                      deploymentTargets: DeploymentTargets) -> Target {
        let dependencies = (
            featureDependencies.map(\.target)
            + coreDependencies.map(\.target)
            + thirdPartyDependencies.map(\.target)
        ).map { TargetDependency.target($0) }
        
        return Target(
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
