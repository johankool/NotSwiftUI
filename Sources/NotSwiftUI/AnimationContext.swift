//
//  AnimationContext.swift
//  NotSwiftUI
//
//  Created by Johan Kool on 09/11/2024.
//


public struct AnimationContext<Value> where Value : VectorArithmetic {

    /// The current state of a custom animation.
    ///
    /// An instance of ``CustomAnimation`` uses this property to read and
    /// write state values as the animation runs.
    ///
    /// An alternative to using the `state` property in a custom animation is
    /// to create an ``AnimationStateKey`` type and extend ``AnimationContext``
    /// with a custom property that returns the state as a custom type. For
    /// example, the following code creates a state key named `PausableState`.
    /// It's convenient to store state values in the key type, so the
    /// `PausableState` structure includes properties for the stored state
    /// values `paused` and `pauseTime`.
    ///
    ///     private struct PausableState<Value: VectorArithmetic>: AnimationStateKey {
    ///         var paused = false
    ///         var pauseTime: TimeInterval = 0.0
    ///
    ///         static var defaultValue: Self { .init() }
    ///     }
    ///
    /// To provide access the pausable state, the following code extends
    /// `AnimationContext` to include the `pausableState` property. This
    /// property returns an instance of the custom `PausableState` structure
    /// stored in ``AnimationContext/state``, and it can also store a new
    /// `PausableState` instance in `state`.
    ///
    ///     extension AnimationContext {
    ///         fileprivate var pausableState: PausableState<Value> {
    ///             get { state[PausableState<Value>.self] }
    ///             set { state[PausableState<Value>.self] = newValue }
    ///         }
    ///     }
    ///
    /// Now a custom animation can use the `pausableState` property instead of
    /// the ``AnimationContext/state`` property as a convenient way to read and
    /// write state values as the animation runs.
    ///
    ///     struct PausableAnimation: CustomAnimation {
    ///         func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
    ///             let pausableState = context.pausableState
    ///             var pauseTime = pausableState.pauseTime
    ///             ...
    ///         }
    ///     }
    ///
    public var state: AnimationState<Value>

    /// Set this to `true` to indicate that an animation is logically complete.
    ///
    /// This controls when AnimationCompletionCriteria.logicallyComplete
    /// completion callbacks are fired. This should be set to `true` at most
    /// once in the life of an animation, changing back to `false` later will be
    /// ignored. If this is never set to `true`, the behavior is equivalent to
    /// if this had been set to `true` just as the animation finished (by
    /// returning `nil`).
    public var isLogicallyComplete: Bool

//    /// The current environment of the view that created the custom animation.
//    ///
//    /// An instance of ``CustomAnimation`` uses this property to read
//    /// environment values from the view that created the animation. To learn
//    /// more about environment values including how to define custom
//    /// environment values, see ``EnvironmentValues``.
//    public var environment: EnvironmentValues { get }

    /// Creates a new context from another one with a state that you provide.
    ///
    /// Use this method to create a new context that contains the state that
    /// you provide and view environment values from the original context.
    ///
    /// - Parameter state: The initial state for the new context.
    /// - Returns: A new context that contains the specified state.
    public func withState<T>(_ state: AnimationState<T>) -> AnimationContext<T> where T : VectorArithmetic {
        fatalError()
    }
}
