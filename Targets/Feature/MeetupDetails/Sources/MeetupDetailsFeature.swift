import ComposableArchitecture
import Foundation
import SwiftUpKit
import SwiftUpUI

@Reducer
public struct MeetupDetailsFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Identifiable {
        public let id: UUID
        let title: String
        let description: String
        var talks: IdentifiedArrayOf<TalkItemFeature.State>
        let tags: [String]
        let city: String
        let date: String
        let capacity: String
        
        public init(meetup: Meetup) {
            self.id = meetup.id
            self.title = meetup.title
            self.description = meetup.description
            self.talks = .init(uniqueElements: meetup
                .talks
                .map { TalkItemFeature.State(talk: $0) })
            self.tags = meetup.tags.map { "\($0)" }
            self.city = meetup.city
            self.capacity = meetup.capacity
            
            @Dependency(\.eventDateFormatter) var dateFormatter
            self.date = dateFormatter.formatDate(meetup.date)
        }
    }

    public enum Action {
        case talks(IdentifiedActionOf<TalkItemFeature>)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .talks:
                return .none
            }
        }
        .forEach(\.talks, action: \.talks) {
            TalkItemFeature()
        }
    }
    
    public init() {}
}
