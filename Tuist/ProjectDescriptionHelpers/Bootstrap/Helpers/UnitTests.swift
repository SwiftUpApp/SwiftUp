import ProjectDescription

public struct UnitTests {
    public let thirdPartyDependencies: [ThirdParty]
    public let sources: SourceFilesList
    
    public init(thirdPartyDependencies: [ThirdParty], sources: SourceFilesList) {
        self.thirdPartyDependencies = thirdPartyDependencies
        self.sources = sources
    }
    
    public func target(of target: Target) -> Target {
        .unitTests(
            of: target,
            destinations: target.destinations,
            sources: sources,
            thirdPartyDependencies: thirdPartyDependencies
        )
    }
}
