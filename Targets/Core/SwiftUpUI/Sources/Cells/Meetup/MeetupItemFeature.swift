import ComposableArchitecture
import Foundation
import SwiftUpKit

@Reducer
public struct MeetupItemFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Identifiable {
        public let meetup: Meetup
        
        public var id: UUID { meetup.id }
        public var title: String { meetup.title }
        public var description: String { meetup.description }
        public var tags: [String] { meetup.tags.map { "\($0)" } }
        public var city: String { meetup.city }

        public init(meetup: Meetup) {
            self.meetup = meetup
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
