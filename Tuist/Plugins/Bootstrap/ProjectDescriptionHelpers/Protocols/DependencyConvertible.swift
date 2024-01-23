import enum ProjectDescription.TargetDependency

public protocol DependencyConvertible {
    var dependency: TargetDependency { get }
}