internal final class Node {
    var children: [Node] = []
    var needsRebuild = true
    var view: BuiltinView?
    var previousView: Any?
    var stateProperties: [String: Any] = [:]
    var environmentValues = EnvironmentValues()

    @MainActor
    func rebuildIfNeeded() {
        view?._buildNodeTree(self)
    }

    func setNeedsRebuild() {
        needsRebuild = true
    }
}

internal extension Node {
    func dump(depth: Int = 0) {
        let indent = String(repeating: "  ", count: depth)
        print("\(indent)\(view)")
        for child in children {
            child.dump(depth: depth + 1)
        }
    }
}
