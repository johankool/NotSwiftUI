//
//  AnimationState.swift
//  NotSwiftUI
//
//  Created by Johan Kool on 09/11/2024.
//


public struct AnimationState<Value> where Value : VectorArithmetic {

    /// Create an empty state container.
    ///
    /// You don't typically create an instance of ``AnimationState`` directly.
    /// Instead, the ``AnimationContext`` provides the animation state to an
    /// instance of ``CustomAnimation``.
    public init() {
        
    }

    /// Accesses the state for a custom key.
    ///
    /// Create a custom animation state value by defining a key that conforms
    /// to the ``AnimationStateKey`` protocol and provide the
    /// ``AnimationStateKey/defaultValue`` for the key. Also include properties
    /// to read and write state values that your ``CustomAnimation`` uses. For
    /// example, the following code defines a key named `PausableState` that
    /// has two state values, `paused` and `pauseTime`:
    ///
    ///     private struct PausableState<Value: VectorArithmetic>: AnimationStateKey {
    ///         var paused = false
    ///         var pauseTime: TimeInterval = 0.0
    ///
    ///         static var defaultValue: Self { .init() }
    ///     }
    ///
    /// Use that key with the subscript operator of the ``AnimationState``
    /// structure to get and set a value for the key. For more convenient
    /// access to the key value, extend ``AnimationContext`` with a computed
    /// property that gets and sets the key's value.
    ///
    ///     extension AnimationContext {
    ///         fileprivate var pausableState: PausableState<Value> {
    ///             get { state[PausableState<Value>.self] }
    ///             set { state[PausableState<Value>.self] = newValue }
    ///         }
    ///     }
    ///
    /// To access the state values in a ``CustomAnimation``, call the custom
    /// computed property, then read and write the state values that the
    /// custom ``AnimationStateKey`` provides.
    ///
    ///     struct PausableAnimation: CustomAnimation {
    ///         let base: Animation
    ///
    ///         func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
    ///             let paused = context.environment.animationPaused
    ///
    ///             let pausableState = context.pausableState
    ///             var pauseTime = pausableState.pauseTime
    ///             if pausableState.paused != paused {
    ///                 pauseTime = time - pauseTime
    ///                 context.pausableState = PausableState(paused: paused, pauseTime: pauseTime)
    ///             }
    ///
    ///             let effectiveTime = paused ? pauseTime : time - pauseTime
    ///             let result = base.animate(value: value, time: effectiveTime, context: &context)
    ///             return result
    ///         }
    ///     }
//    public subscript<K>(key: K.Type) -> K.Value where K : AnimationStateKey {
//        
//    }
}
