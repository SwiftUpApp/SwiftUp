import Bootstrap
import ProjectDescription

public enum ThirdParty: CaseIterable {
    case composableArchitecture
}

extension ThirdParty: ExternalSourceConvertible {
    public var externalSource: ExternalSource {
        switch self {
        case .composableArchitecture:
            return .init(
                package: .package(
                    url: "https://github.com/pointfreeco/swift-composable-architecture.git",
                    from: "1.0.0"),
                product: "ComposableArchitecture")
        }
    }
}

extension ThirdParty: TargetConvertible {
    public var target: Target {
        FrameworkBuilder {
            $0.dependencies = [.external(name: externalSource.product)]
        }
        .build(
            name: externalSource.product,
            destinations: Global.destinations,
            bundleID: Global.bundleID + ".\(externalSource.product.lowercased())",
            sources: [],
            deploymentTargets: Global.deploymentTarget)
    }
}
