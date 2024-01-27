import ComposableArchitecture
import Foundation
import SwiftUpKit

public struct MeetupItemFeature: Reducer {
    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let title: String
        public let description: String
        public let tags: [String]

        public init(id: UUID = .init(), meetup: Meetup) {
            self.id = id
            self.title = meetup.title
            self.description = meetup.description
            self.tags = meetup.tags
        }
    }
    
    public enum Action: Equatable {
        case didSelectMeetup
        case didSelectShare
        case didSelectSave
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didSelectMeetup:
                return .none
            case .didSelectShare:
                return .none
            case .didSelectSave:
                return .none
            }
        }
    }
    
    public init () {}
}

public extension MeetupItemFeature.State {
    static let mock: Self = .init(
        id: .init(),
        meetup: .mock)
}
