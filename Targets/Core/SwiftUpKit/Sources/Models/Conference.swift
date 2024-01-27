import Foundation

public struct Conference: Identifiable {
    public var id: UUID
    public var name: String
    public var imageURL: URL
    public var city: String
    
    public init(id: UUID, name: String, imageURL: URL, city: String) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.city = city
    }
}

public extension Conference {
    static let mock: Self = .init(
        id: .init(),
        name: "MobiConf",
        imageURL: URL(string: "https://picsum.photos/300/300")!,
        city: "Kraków"
    )
}
