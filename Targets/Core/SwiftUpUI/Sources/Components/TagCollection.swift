import SwiftUI

public struct TagCollection: View {
    private let tags: [String]
    
    public init(_ tags: [String]) {
        self.tags = tags
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 6)
                        .background(Color.blue)
                        .frame(height: 25)
                        .cornerRadius(5)
                }
            }
        }
    }
}

struct TagCollectionPreviews: PreviewProvider {
    static var previews: some View {
        AppearanceGroup {
            TagCollection(Array(repeating: "Content", count: 10))
        }
    }
}
