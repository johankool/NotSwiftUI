//
//  Transaction.swift
//  NotSwiftUI
//
//  Created by Johan Kool on 09/11/2024.
//


@frozen public struct Transaction {

    public let animation: Animation?
    
    /// Creates a transaction.
    @inlinable public init() {
        animation = nil
    }

    @inlinable init(animation: Animation?) {
        self.animation = animation
    }
    
    /// Accesses the transaction value associated with a custom key.
    ///
    /// Create custom transaction values by defining a key that conforms to the
    /// ``TransactionKey`` protocol, and then using that key with the subscript
    /// operator of the ``Transaction`` structure to get and set a value for
    /// that key:
    ///
    ///     private struct MyTransactionKey: TransactionKey {
    ///         static let defaultValue = false
    ///     }
    ///
    ///     extension Transaction {
    ///         var myCustomValue: Bool {
    ///             get { self[MyTransactionKey.self] }
    ///             set { self[MyTransactionKey.self] = newValue }
    ///         }
    ///     }
//    public subscript<K>(key: K.Type) -> K.Value where K : TransactionKey
}

public func withTransaction<Result>(_ transaction: Transaction, _ body: () throws -> Result) rethrows -> Result {
    fatalError()
}
