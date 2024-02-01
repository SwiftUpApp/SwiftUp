import Localization

public enum Tag: Equatable, CustomStringConvertible {
    case city(City)
    case competency(Competency)
    case practices(Practices)
    case tools(Tools)
    case other(Other)
    
    public var description: String {
        switch self {
        case let .city(city):
            return city.description
        case let .competency(competency):
            return competency.description
        case let .practices(practices):
            return practices.description
        case let .tools(tools):
            return tools.description
        case let .other(other):
            return other.description
        }
    }
    
    public enum City: CustomStringConvertible {
        case cracow
        case gdansk
        case lodz
        case warsaw
        case wroclaw
        
        public var description: String {
            switch self {
            case .cracow:
                return L10n.Tag.City.cracow
            case .gdansk:
                return L10n.Tag.City.gdansk
            case .lodz:
                return L10n.Tag.City.lodz
            case .warsaw:
                return L10n.Tag.City.warsaw
            case .wroclaw:
                return L10n.Tag.City.wroclaw
            }
        }
    }
    
    public enum Competency: CustomStringConvertible {
        case beginner
        case intermediate
        case advanced
        
        public var description: String {
            switch self {
            case .beginner:
                return L10n.Tag.Competency.beginner
            case .intermediate:
                return L10n.Tag.Competency.intermediate
            case .advanced:
                return L10n.Tag.Competency.advanced
            }
        }
    }

    public enum Practices: CustomStringConvertible {
        case architecture
        case bestPractices
        case debugging
        case modularisation
        case testing
        case tipsAndTricks
        
        public var description: String {
            switch self {
            case .architecture:
                return L10n.Tag.Practices.architecture
            case .bestPractices:
                return L10n.Tag.Practices.bestPractices
            case .debugging:
                return L10n.Tag.Practices.debugging
            case .modularisation:
                return L10n.Tag.Practices.modularisation
            case .testing:
                return L10n.Tag.Practices.testing
            case .tipsAndTricks:
                return L10n.Tag.Practices.tipsAndTricks
            }
        }
    }

    public enum Tools: CustomStringConvertible {
        case combine
        case networking
        case server
        case swiftUI
        case uiKit
        
        public var description: String {
            switch self {
            case .combine:
                return L10n.Tag.Tools.combine
            case .networking:
                return L10n.Tag.Tools.networking
            case .server:
                return L10n.Tag.Tools.server
            case .swiftUI:
                return L10n.Tag.Tools.swiftUI
            case .uiKit:
                return L10n.Tag.Tools.uiKit
            }
        }
    }

    public enum Other: CustomStringConvertible {
        case design
        case multiplatform
        
        public var description: String {
             switch self {
             case .design:
                 return L10n.Tag.Other.design
             case .multiplatform:
                 return L10n.Tag.Other.multiplatform
             }
         }
    }
}
