import ProjectDescription

public enum ThirdParty: CaseIterable {
    case composableArchitecture
    
    public var product: String {
        switch self {
        case .composableArchitecture: 
            return "ComposableArchitecture"
        }
    }
    
    public var package: Package {
        switch self {
        case .composableArchitecture:
            return .remote(
                url: "https://github.com/pointfreeco/swift-composable-architecture",
                requirement: .upToNextMajor(from: "1.5.6")
            )
        }
    }
}

extension ThirdParty {
    public var target: Target {
        Target(
            name: product,
            destinations: Global.destinations,
            product: .framework,
            bundleId: Global.bundleID + ".\(product.lowercased())",
            deploymentTargets: Global.deploymentTarget,
            sources: [],
            dependencies: [.package(product: product)]
        )
    }
}
