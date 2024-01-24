import ProjectDescription

public protocol TargetConvertible: DependencyConvertible {
    var targets: [Target] { get }
}

extension TargetConvertible {
    public var dependency: TargetDependency {
        targets.map { .target($0) }
    }
}
