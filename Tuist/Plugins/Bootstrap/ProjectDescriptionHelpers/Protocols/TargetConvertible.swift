import ProjectDescription

public protocol TargetConvertible: DependencyConvertible {
    var target: Target { get }
}

extension TargetConvertible {
    public var dependency: TargetDependency {
        .target(target)
    }
}
