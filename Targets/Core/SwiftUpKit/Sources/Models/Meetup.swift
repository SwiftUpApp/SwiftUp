import Foundation

public struct Meetup: Identifiable {
    public let id: UUID
    public let title: String
    public let description: String
    public let tags: [String]
    public let city: String
    
    public init(
        id: UUID,
        title: String,
        description: String,
        tags: [String],
        city: String
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.tags = tags
        self.city = city
    }
}

extension Meetup {
    public static let mock = Meetup(
        id: UUID(),
        title: "SwiftUp #1",
        description: "Read Marcel's curated selection of new conferences from this month",
        tags: ["iOS Development", "Conference"],
        city: "Wrocław"
    )
}
