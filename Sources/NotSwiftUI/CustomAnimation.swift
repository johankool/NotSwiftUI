public import Foundation

@preconcurrency public protocol CustomAnimation : Hashable, Sendable {

    /// Calculates the value of the animation at the specified time.
    ///
    /// Implement this method to calculate and return the value of the
    /// animation at a given point in time. If the animation has finished,
    /// return `nil` as the value. This signals to the system that it can
    /// remove the animation.
    ///
    /// If your custom animation needs to maintain state between calls to the
    /// `animate(value:time:context:)` method, store the state data in
    /// `context`. This makes the data available to the method next time
    /// the system calls it. To learn more about managing state data in a
    /// custom animation, see ``AnimationContext``.
    ///
    /// - Parameters:
    ///   - value: The vector to animate towards.
    ///   - time: The elapsed time since the start of the animation.
    ///   - context: An instance of ``AnimationContext`` that provides access
    ///   to state and the animation environment.
    /// - Returns: The current value of the animation, or `nil` if the
    ///   animation has finished.
    nonisolated func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic

    /// Calculates the velocity of the animation at a specified time.
    ///
    /// Implement this method to provide the velocity of the animation at a
    /// given time. Should subsequent animations merge with the animation,
    /// the system preserves continuity of the velocity between animations.
    ///
    /// The default implementation of this method returns `nil`.
    ///
    /// > Note: State and environment data is available to this method via the
    /// `context` parameter, but `context` is read-only. This behavior is
    /// different than with ``animate(value:time:context:)`` and
    /// ``shouldMerge(previous:value:time:context:)`` where `context` is
    /// an `inout` parameter, letting you change the context including state
    /// data of the animation. For more information about managing state data
    /// in a custom animation, see ``AnimationContext``.
    ///
    /// - Parameters:
    ///   - value: The vector to animate towards.
    ///   - time: The amount of time since the start of the animation.
    ///   - context: An instance of ``AnimationContext`` that provides access
    ///   to state and the animation environment.
    /// - Returns: The current velocity of the animation, or `nil` if the
    ///   animation has finished.
    nonisolated func velocity<V>(value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic

    /// Determines whether an instance of the animation can merge with other
    /// instance of the same type.
    ///
    /// When a view creates a new animation on an animatable value that already
    /// has a running animation of the same animation type, the system calls
    /// the `shouldMerge(previous:value:time:context:)` method on the new
    /// instance to determine whether it can merge the two instance. Implement
    /// this method if the animation can merge with another instance. The
    /// default implementation returns `false`.
    ///
    /// If `shouldMerge(previous:value:time:context:)` returns `true`, the
    /// system merges the new animation instance with the previous animation.
    /// The system provides to the new instance the state and elapsed time from
    /// the previous one. Then it removes the previous animation.
    ///
    /// If this method returns `false`, the system doesn't merge the animation
    /// with the previous one. Instead, both animations run together and the
    /// system combines their results.
    ///
    /// If your custom animation needs to maintain state between calls to the
    /// `shouldMerge(previous:value:time:context:)` method, store the state
    /// data in `context`. This makes the data available to the method next
    /// time the system calls it. To learn more, see ``AnimationContext``.
    ///
    /// - Parameters:
    ///   - previous: The previous running animation.
    ///   - value: The vector to animate towards.
    ///   - time: The amount of time since the start of the previous animation.
    ///   - context: An instance of ``AnimationContext`` that provides access
    ///   to state and the animation environment.
    /// - Returns: A Boolean value of `true` if the animation should merge with
    ///   the previous animation; otherwise, `false`.
    nonisolated func shouldMerge<V>(previous: Animation, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic 
}
