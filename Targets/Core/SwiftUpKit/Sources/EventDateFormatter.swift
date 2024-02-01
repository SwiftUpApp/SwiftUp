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
        .init(formatDate: { date in
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM d, yyyy"
            formatter.locale = .current
            return formatter.string(from: date)
        })
    }()
}

public struct EventDateFormatter {
    public var formatDate: (Date) -> String
}
