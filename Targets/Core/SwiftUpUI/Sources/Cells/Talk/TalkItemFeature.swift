import ComposableArchitecture
import struct Foundation.UUID
import Localization
import struct SwiftUpKit.Talk

@Reducer
public struct TalkItemFeature {
    @ObservableState
    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let title: String
        public let speaker: String
        public let tags: [String]
        
        public init(talk: Talk) {
            self.id = talk.id
            self.title = talk.title
            self.speaker = "\(L10n.Talk.Speaker.prefix)\(talk.speaker)"
            self.tags = talk.tags.map { "\($0)" }
        }
    }
    
    public enum Action {
        case didSelectTalk
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didSelectTalk:
                return .none
            }
        }
    }
}
