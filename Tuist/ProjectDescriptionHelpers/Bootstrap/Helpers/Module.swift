import ProjectDescription

public protocol Module {
    var path: String { get }
    var mainTarget: Target { get }
    var allTargets: [Target] { get }
}
