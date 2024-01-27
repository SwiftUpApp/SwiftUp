import ComposableArchitecture
import Foundation
import SwiftUpKit

@Reducer
public struct ConferenceItemFeature {
    public struct State: Equatable {
        public let id: UUID
        public let name: String
        public let imageURL: URL
        public let city: String
        
        public init(conference: Conference) {
            self.id = conference.id
            self.name = conference.name
            self.imageURL = conference.imageURL
            self.city = conference.city
        }
    }
    
    public enum Action {
        case didSelectConference
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didSelectConference:
                return .none
            }
        }
    }
}
