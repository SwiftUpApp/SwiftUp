import SwiftUI
import ComposableArchitecture

public struct AppearanceGroup<Content: View>: View {
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        WithPerceptionTracking {
            Group {
                content
                    .preferredColorScheme(.light)
                    .previewDisplayName("Light Mode")
                
                content
                    .preferredColorScheme(.dark)
                    .previewDisplayName("Dark Mode")
            }
        }
    }
}
