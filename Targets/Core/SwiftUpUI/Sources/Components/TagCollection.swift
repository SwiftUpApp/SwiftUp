import SwiftUI

public struct TagCollection: View {
    private let tags: [String]
    
    public init(_ tags: [String]) {
        self.tags = tags
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            TagLayout() {
                ForEach(tags, id: \.self) { tag in
                    tagView(for: tag)
                }
            }
        }
    }
}

private extension TagCollection {
    func tagView(for tag: String) -> some View {
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

struct TagCollectionPreviews: PreviewProvider {
    static var previews: some View {
        let tags: [String] = [
            "Apple",
            "iOS Development",
            "Swift",
            "WWDC",
            "Best Practices",
            "Architecture",
            "Networking",
            "Design",
            "Server",
            "Objective-C"
        ]
        return AppearanceGroup {
            TagCollection(tags.shuffled())
        }
    }
}

private struct TagLayout: Layout {
    var spacing: CGFloat = 5
    var lineSpacing: CGFloat = 5
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width: CGFloat = proposal.width ?? .zero
        var height: CGFloat = .zero
        
        let rows = makeRows(
            maxWidth: width,
            proposedContainerSize: proposal,
            subviews: subviews)
        
        for (index, rowElements) in rows.enumerated() {
            let lastElementIndex = rows.count - 1
            let verticalSpacing = (index == lastElementIndex) ? .zero : lineSpacing
            height += rowElements.calculateMaxHeight(for: proposal) + verticalSpacing
        }
        
        return CGSize(width: width, height: height)
    }
    
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews, 
        cache: inout ()) {
            var origin = bounds.origin
            let width = bounds.width
            let rows = makeRows(
                maxWidth: width,
                proposedContainerSize: proposal,
                subviews: subviews)
            
            for row in rows {
                origin.x = .zero
                
                for subview in row {
                    let subviewSize = subview.sizeThatFits(proposal)
                    subview.place(at: origin, proposal: proposal)
                    origin.x += subviewSize.width + spacing
                }
                
                origin.y += row.calculateMaxHeight(for: proposal) + lineSpacing
            }
    }
}

private extension TagLayout {
    func makeRows(
        maxWidth: CGFloat,
        proposedContainerSize: ProposedViewSize,
        subviews: Subviews) -> [[LayoutSubviews.Element]] {
        var currentRow: [LayoutSubviews.Element] = []
        var allRows: [[LayoutSubviews.Element]] = []
        
        var originX: CGFloat = .zero
        
        for subview in subviews {
            let proposedSubviewWidth = subview.sizeThatFits(proposedContainerSize).width + spacing
            
            if (originX + proposedSubviewWidth) > maxWidth {
                allRows.append(currentRow)
                currentRow.removeAll()
                originX = .zero
                currentRow.append(subview)
                originX += proposedSubviewWidth
            } else {
                currentRow.append(subview)
                originX += proposedSubviewWidth
            }
        }
        
        if currentRow.isEmpty == false {
            allRows.append(currentRow)
            currentRow.removeAll()
        }
        
        return allRows
    }
}


private extension Collection where Element == LayoutSubviews.Element {
    func calculateMaxHeight(for proposedContainerSize: ProposedViewSize) -> CGFloat {
        compactMap {
            $0.sizeThatFits(proposedContainerSize).height
        }
        .max() ?? .zero
    }
}
