import ProjectDescription

extension Target {
    public static func unitTests(
        of target: Target,
        destinations: Destinations,
        sources: SourceFilesList?,
        dependencies: [TargetDependency] = []) -> Target {
            makeTests(
                ofUI: false,
                destinations: destinations,
                target: target,
                sources: sources,
                dependencies: dependencies)
    }
    
    public static func uiTests(
        of target: Target,
        destinations: Destinations,
        sources: SourceFilesList?,
        dependencies: [TargetDependency] = []) -> Target {
            makeTests(
                ofUI: true,
                destinations: destinations,
                target: target,
                sources: sources,
                dependencies: dependencies)
    }
    
    private static func makeTests(ofUI: Bool,
                                  destinations: Destinations,
                                  target: Target,
                                  sources: SourceFilesList?,
                                  dependencies: [TargetDependency]) -> Target {
        Target(
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
