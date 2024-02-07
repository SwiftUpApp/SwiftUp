import ComposableArchitecture
import XCTest
@testable import Events
@testable import SwiftUpUI

final class EventsFeatureTests: XCTestCase {
    @MainActor
    func testDidSelectMeetupActionInitializesMeetupDetails() async {
        let meetupState: MeetupItemFeature.State = .mock
        let meetup = EventFeature.State.meetup(meetupState)
        
        let testStore = TestStore(
            initialState: .init(
                events: [
                    meetup
                ]
            ),
            reducer: EventsFeature.init
        )
        
        await testStore.send(.events(.element(id: meetupState.id, action: .meetup(.didSelectMeetup)))) {
            $0.meetupDetails = .init(meetup: meetupState.meetup)
        }
    }
}
