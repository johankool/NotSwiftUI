@resultBuilder
@MainActor
public struct ViewBuilder {
    public static func buildBlock<V: View>(_ content: V) -> V {
        content
    }

    @available(iOS 17.0.0, macOS 14.0.0, *)
    public static func buildBlock<each Content>(_ content: repeat each Content) -> TupleView<repeat each Content> where repeat each Content: View {
        TupleView(repeat each content)
    }

    public static func buildOptional<Content>(_ content: Content?) -> some View where Content: View {
        content
    }
}
