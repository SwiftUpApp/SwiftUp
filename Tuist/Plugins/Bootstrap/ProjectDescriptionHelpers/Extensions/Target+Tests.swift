import ProjectDescription

extension Target {
    public static func unitTests(
        of target: Target,
        sources: SourceFilesList?,
        dependencies: [TargetDependency] = []) -> Target {
            makeTests(
                ofUI: false,
                target: target,
                sources: sources,
                dependencies: dependencies)
    }
    
    public static func uiTests(
        of target: Target,
        sources: SourceFilesList?,
        dependencies: [TargetDependency] = []) -> Target {
            makeTests(
                ofUI: true,
                target: target,
                sources: sources,
                dependencies: dependencies)
    }
    
    private static func makeTests(ofUI: Bool,
                                  target: Target,
                                  sources: SourceFilesList?,
                                  dependencies: [TargetDependency]) -> Target {
        Target(
            name: target.name + (ofUI ? "UI" : "Unit") + "Tests",
            platform: target.platform,
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
