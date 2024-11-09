
public protocol VectorArithmetic : AdditiveArithmetic {

    /// Multiplies each component of this value by the given value.
    mutating func scale(by rhs: Double)

    /// Returns the dot-product of this vector arithmetic instance with itself.
    var magnitudeSquared: Double { get }
}

extension VectorArithmetic {

    /// Returns a value with each component of this value multiplied by the
    /// given value.
    public func scaled(by rhs: Double) -> Self {
        self
    }

    /// Interpolates this value with `other` by the specified `amount`.
    ///
    /// This is equivalent to `self = self + (other - self) * amount`.
    public mutating func interpolate(towards other: Self, amount: Double) {
        
    }

    /// Returns this value interpolated with `other` by the specified `amount`.
    ///
    /// This result is equivalent to `self + (other - self) * amount`.
    public func interpolated(towards other: Self, amount: Double) -> Self {
        self
    }
}
