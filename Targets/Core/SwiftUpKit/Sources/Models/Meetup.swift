import Foundation

public struct Meetup: Identifiable {
    public let id: UUID
    public let title: String
    public let date: Date
    public let description: String
    public let talks: [Talk]
    public let tags: [Tag]
    public let city: String
    public let capacity: String
    
    public init(
        id: UUID,
        title: String,
        date: Date,
        description: String,
        talks: [Talk],
        tags: [Tag],
        city: String,
        capacity: String) {
        self.id = id
        self.title = title
        self.date = date
        self.description = description
        self.talks = talks
        self.tags = tags
        self.city = city
        self.capacity = capacity
    }
}

extension Meetup {
    public static let mock = Meetup(
        id: UUID(),
        title: "SwiftUp #1",
        date: .now + (24 * 3600 * .random(in: 7...30)),
        description: "Read Marcel's curated selection of new conferences from this month",
        talks: [.mock, .mock, .mock],
        tags: [.city(.cracow), .tools(.swiftUI)],
        city: "Cracow",
        capacity: "150-200"
    )
}
