import ComposableArchitecture
import Foundation
import SwiftUpKit

@Reducer
public struct MeetupItemFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let title: String
        public let description: String
        public let tags: [String]
        public let city: String

        public init(meetup: Meetup) {
            self.id = meetup.id
            self.title = meetup.title
            self.description = meetup.description
            self.tags = meetup.tags
            self.city = meetup.city
        }
        
        public static let mock: Self = .init(meetup: .mock)
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
    
    public init() {}
}
