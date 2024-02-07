import ComposableArchitecture
import Foundation
import SwiftUpUI
import MeetupDetails

@Reducer
public struct EventsFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        var events: IdentifiedArrayOf<EventFeature.State> = []
        @Presents var meetupDetails: MeetupDetailsFeature.State?
        
        public init(
            events: IdentifiedArrayOf<EventFeature.State> = [],
            meetupDetails: MeetupDetailsFeature.State? = nil
        ) {
            self.events = events
            self.meetupDetails = meetupDetails
        }
        
        public static let mock: Self = .init(
            events: .mock,
            meetupDetails: nil
        )
    }

    public enum Action {
        case onAppear
        case events(IdentifiedActionOf<EventFeature>)
        case meetupDetails(PresentationAction<MeetupDetailsFeature.Action>)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            case let .events(.element(id, action)):
                switch action {
                case .meetup(.didSelectMeetup),
                        .conference(.didSelectConference):
                    return handleDidSelectEvent(&state, eventID: id)
                default:
                    return .none
                }
            case .meetupDetails:
                return .none
            }
        }
        .forEach(\.events, action: \.events) {
            EventFeature()
        }
        .ifLet(\.$meetupDetails, action: \.meetupDetails) {
            MeetupDetailsFeature()
        }
    }
    
    public init() {}
}

private extension EventsFeature {
    func handleDidSelectEvent(_ state: inout State, eventID: UUID) -> Effect<Action> {
        guard let event = state.events[id: eventID] else {
            return .none
        }
        
        switch event {
        case .conference:
            fatalError("no conference")
        case let .meetup(meetupState):
            state.meetupDetails = .init(meetup: meetupState.meetup)
        }
        
        return .none
    }
}
