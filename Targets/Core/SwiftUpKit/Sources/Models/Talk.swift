import struct Foundation.UUID

public struct Talk: Identifiable {
    public let id: UUID
    public let title: String
    public let speaker: String
    public let tags: [Tag]
    
    public init(
        id: UUID,
        title: String,
        speaker: String,
        tags: [Tag]) {
        self.id = id
        self.title = title
        self.speaker = speaker
        self.tags = tags
    }
}

extension Talk {
    public static let mock = Talk(
        id: UUID(),
        title: "Build quicker with TCA 1.7.2",
        speaker: "Krzysztof Babis",
        tags: [.city(.cracow), .practices(.architecture), .practices(.tipsAndTricks)]
    )
}
