import ProjectDescription

public final class FrameworkBuilder {
    public var infoPlist: InfoPlist = .default
    public var resources: ResourceFileElements?
    public var dependencies: [TargetDependency] = []
    public var unitTests: UnitTests?
    public var settings: Settings?
    
    public init(with configure: ((inout FrameworkBuilder) -> Void)) {
        var this = self
        configure(&this)
    }
    
    public func build(name: String,
                      destinations: Destinations,
                      bundleID: String,
                      sources: SourceFilesList,
                      deploymentTargets: DeploymentTargets
                      
    ) -> [Target] {
        var targets: [Target] = []
        
        let featureTarget = Target(
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
