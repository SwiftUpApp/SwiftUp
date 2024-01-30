import ComposableArchitecture
import Foundation
import SwiftUpKit

@Reducer
public struct ConferenceItemFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Identifiable {
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
        
        public static let mock: Self = .init(conference: .mock)
    }
    
    public enum Action: Equatable {
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
    
    public init() {}
}
