import Foundation
import ComposableArchitecture

@Reducer
public struct EventFeature: Reducer {
    @ObservableState
    public enum State: Identifiable, Equatable {
        case meetup(MeetupItemFeature.State)
        case conference(ConferenceItemFeature.State)
        
        public var id: UUID {
            switch self {
            case .meetup(let meetup):
                return meetup.id
            case .conference(let conference):
                return conference.id
            }
        }
        
        public static func == (lhs: Self, rhs: Self) -> Bool {
            switch (lhs, rhs) {
            case (.meetup(let lhs), .meetup(let rhs)):
                return lhs.id == rhs.id
            case (.conference(let lhs), .conference(let rhs)):
                return lhs.id == rhs.id
            default:
                return false
            }
        }
    }
    
    public enum Action {
        case onAppear
        case meetup(MeetupItemFeature.Action)
        case conference(ConferenceItemFeature.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { _, _ in
            return .none
        }
        .ifCaseLet(\.meetup, action: \.meetup) {
            MeetupItemFeature()
        }
        .ifCaseLet(\.conference, action: \.conference) {
            ConferenceItemFeature()
        }
    }
    
    public init() {}
}

public extension IdentifiedArray where Element == EventFeature.State, ID == UUID {
    static var mock: Self = [
        .meetup(.mock),
        .conference(.mock)
    ]
}
