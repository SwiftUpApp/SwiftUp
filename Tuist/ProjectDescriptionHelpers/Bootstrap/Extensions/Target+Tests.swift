import ProjectDescription

extension Target {
    public static func unitTests(
        of target: Target,
        destinations: Destinations,
        sources: SourceFilesList?,
        featureDependencies: [Feature] = [],
        coreDependencies: [Core] = [],
        thirdPartyDependencies: [ThirdParty] = []) -> Target {
            makeTests(
                ofUI: false,
                destinations: destinations,
                target: target,
                sources: sources,
                featureDependencies: featureDependencies,
                coreDependencies: coreDependencies,
                thirdPartyDependencies: thirdPartyDependencies)
    }
    
    public static func uiTests(
        of target: Target,
        destinations: Destinations,
        sources: SourceFilesList?,
        featureDependencies: [Feature] = [],
        coreDependencies: [Core] = [],
        thirdPartyDependencies: [ThirdParty] = []) -> Target {
            makeTests(
                ofUI: true,
                destinations: destinations,
                target: target,
                sources: sources,
                featureDependencies: featureDependencies,
                coreDependencies: coreDependencies,
                thirdPartyDependencies: thirdPartyDependencies)
    }
    
    private static func makeTests(ofUI: Bool,
                                  destinations: Destinations,
                                  target: Target,
                                  sources: SourceFilesList?,
                                  featureDependencies: [Feature],
                                  coreDependencies: [Core],
                                  thirdPartyDependencies: [ThirdParty]) -> Target {
        let dependencies = (
            featureDependencies.map(\.target)
            + coreDependencies.map(\.target)
            + thirdPartyDependencies.map(\.target)
        ).map { TargetDependency.target($0) }
        
        return Target(
            name: target.name + (ofUI ? "UI" : "Unit") + "Tests",
            destinations: destinations,
            product: .unitTests,
            bundleId: target.name + (ofUI ? ".ui" : ".unit") + "Tests",
            infoPlist: target.infoPlist,
            sources: sources,
            dependencies: [
                .target(name: target.name),
                .xctest
            ] + dependencies)
    }
}
