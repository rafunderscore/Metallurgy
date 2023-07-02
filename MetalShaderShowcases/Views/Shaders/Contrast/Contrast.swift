import SwiftUI

struct Contrast: View {
    @Binding var name: String
    @Binding var description: String
    @Binding var author: String
    @Binding var category: Categories

    @State var strength: Float = 0

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
                            ShaderLibrary.contrast_layer(
                                .float(strength)
                            ),
                            maxSampleOffset: .zero
                        )
                        .animation(.linear(duration: 1), value: strength)
                }

                ShowcaseParameter(
                    value: $strength,
                    name: Binding.constant("Contrast"),
                    parameter: Binding.constant(Parameters.Float),
                    description: Binding.constant("Effects the strength of the effect."),
                    editatble: Binding.constant(true),
                    range: Binding.constant(-10 ... 10)
                )
            }
        }
    }
}

#Preview {
    Contrast(
        name: .constant("Blacklight"),
        description: .constant("A blacklight effect."),
        author: .constant("Raphael Salaja"),
        category: .constant(Categories.Layer)
    )
}