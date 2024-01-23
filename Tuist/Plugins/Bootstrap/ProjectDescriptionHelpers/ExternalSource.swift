import ProjectDescription

public struct ExternalSource {
    public let package: ProjectDescription.Package
    public let product: String
    
    public init(package: Package, product: String) {
        self.package = package
        self.product = product
    }
}
