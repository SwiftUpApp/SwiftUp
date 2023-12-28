import Bootstrap
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

extension ThirdParty: TargetConvertible {
    public var target: Target {
        FrameworkBuilder {
            $0.dependencies = [
                .package(product: product)
            ]
        }
        .build(
            name: product,
            destinations: Global.destinations,
            bundleID: Global.bundleID + ".\(product.lowercased())",
            sources: [],
            deploymentTargets: Global.deploymentTarget)
    }
}
