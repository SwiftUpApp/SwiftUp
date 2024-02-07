import ComposableArchitecture
import Foundation

public extension DependencyValues {
    var eventDateFormatter: EventDateFormatter {
        get { self[EventDateFormatterKey.self] }
        set { self[EventDateFormatterKey.self] = newValue }
    }
}

private enum EventDateFormatterKey: DependencyKey {
    static let liveValue: EventDateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        formatter.locale = .current
        
        return .init(formatDate: { date in
            formatter.string(from: date)
        })
    }()
    
    static let testValue: EventDateFormatter = .init(
        formatDate: { _ in "December 10th, 2024" }
    )
}

public struct EventDateFormatter {
    public var formatDate: (Date) -> String
}
