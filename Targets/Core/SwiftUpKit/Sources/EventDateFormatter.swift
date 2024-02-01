import ComposableArchitecture
import Foundation

public extension DependencyValues {
    var eventDateFormatter: EventDateFormatter {
        .init(formatDate: { date in
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM d, yyyy"
            formatter.locale = .current
            return formatter.string(from: date)
        })
    }
}

public struct EventDateFormatter {
    public var formatDate: (Date) -> String
}
