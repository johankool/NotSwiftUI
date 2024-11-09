@available(iOS 17.0.0, macOS 14.0.0, *)
public struct TupleView <each T: View>: View {
    public typealias Body = Never

    private let children: (repeat each T)

    public init(_ children: repeat each T) {
        self.children = (repeat each children)
    }
}

@available(iOS 17.0.0, macOS 14.0.0, *)
extension TupleView: BuiltinView {
    func _buildNodeTree(_ node: Node) {
        var idx = 0
        for child in repeat (each children) {
            let child = AnyBuiltinView(child)
            if node.children.count <= idx {
                node.children.append(Node())
            }
            child._buildNodeTree(node.children[idx])
            idx += 1
        }
    }
}
