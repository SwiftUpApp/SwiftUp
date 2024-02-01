import SwiftUI

public struct TagCollection: View {
    private let tags: [String]
    
    public init(_ tags: [String]) {
        self.tags = tags
    }
    
    public var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                        .background {
                            Color.blue
                        }
                        .frame(height: 25)
                        .cornerRadius(5)
                }
            }
        }
    }
}
