import SwiftUI

struct Blacklight: View {
    @Binding var name: String
    @Binding var author: String
    @Binding var category: Categories

    @State var strength: Float = 1.0

    var body: some View {
        TimelineView(.animation) { _ in
            List {
                Section {
                    ShowcaseHeading(
                        name: .constant(name),
                        category: .constant(category),
                        author: .constant(author)
                    )

                    ShowcaseImage()
                        .layerEffect(
                            ShaderLibrary.blacklight(
                                .float(strength)
                            ),
                            maxSampleOffset: .zero
                        )
                        .animation(.linear(duration: 1), value: strength)
                }

                ShowcaseParameter(
                    value: strength,
                    name: Binding.constant("Strength"),
                    editatble: Binding.constant(true),
                    range: Binding.constant(1 ... 10)
                )
            }
        }
    }
}

#Preview {
    Blacklight(
        name: .constant("Blacklight"),
        author: .constant("Raphael Salaja"),
        category: .constant(Categories.Layer)
    )
}
