public struct Meetup {
    public let title: String
    public let description: String
    public let tags: [String]
    
    public init(title: String,
                description: String,
                tags: [String]) {
        self.title = title
        self.description = description
        self.tags = tags
    }
}

extension Meetup {
    public static let mock = Meetup(
        title: "SwiftUp #1",
        description: "Read Marcel's curated selection of new conferences from this month",
        tags: ["iOS Development", "Conference"])
}
