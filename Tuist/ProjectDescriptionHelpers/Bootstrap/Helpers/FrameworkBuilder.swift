import ProjectDescription

public final class FrameworkBuilder {
    public var infoPlist: InfoPlist = .default
    public var resources: ResourceFileElements?
    public var featureDependencies: [Feature] = []
    public var coreDependencies: [Core] = []
    public var thirdPartyDependencies: [ThirdParty] = []
    public var settings: ProjectDescription.Settings?
    
    public init(with configure: ((inout FrameworkBuilder) -> Void)) {
        var this = self
        configure(&this)
    }
    
    public func build(name: String,
                      destinations: Destinations,
                      bundleID: String,
                      sources: SourceFilesList,
                      deploymentTargets: DeploymentTargets) -> Target {
        let dependencies = (
            featureDependencies.map(\.target)
            + coreDependencies.map(\.target)
            + thirdPartyDependencies.map(\.target)
        ).map { TargetDependency.target($0) }
        
        return Target(
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
        
        targets.append(featureTarget)
        
        if let unitTests = unitTests {
            targets.append(
                Target.unitTests(
                    of: featureTarget,
                    destinations: destinations,
                    sources: unitTests.sources,
                    dependencies: unitTests.dependencies
                )
            )
        }
        
        return targets
    }
}

public struct UnitTests {
    public let dependencies: [TargetDependency]
    public let sources: SourceFilesList
    
    public init(dependencies: [TargetDependency], sources: SourceFilesList) {
        self.dependencies = dependencies
        self.sources = sources
    }
}
