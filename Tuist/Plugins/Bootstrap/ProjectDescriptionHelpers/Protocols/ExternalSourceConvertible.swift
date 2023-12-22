import enum ProjectDescription.Package

public protocol ExternalSourceConvertible {
    var externalSource: ExternalSource { get }
}
