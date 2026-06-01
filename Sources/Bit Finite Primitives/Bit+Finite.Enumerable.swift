// Bit+Finite.Enumerable.swift

public import Bit_Boolean_Primitives
public import Bit_Primitives_Standard_Library_Integration
public import Finite_Enumerable_Primitives
public import Cardinal_Primitives
public import Ordinal_Primitives

// MARK: - Finite.Enumerable

extension Bit: Finite.Enumerable {
    /// Number of bit values.
    @inlinable
    public static var count: Cardinal { Cardinal(2) }

    /// Ordinal of this value (0: zero, 1: one).
    @inlinable
    public var ordinal: Ordinal { Ordinal(UInt(rawValue)) }

    /// Creates a value from its ordinal without bounds checking.
    ///
    /// - Parameter __unchecked: Marker parameter indicating unchecked access.
    /// - Parameter ordinal: Must be 0 (zero) or 1 (one).
    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = Self(rawValue: UInt8(truncatingIfNeeded: ordinal.rawValue))!
    }
}

// MARK: - Finite.Enumerable

extension Bit.Order: Finite.Enumerable {
    /// Number of bit order values.
    @inlinable
    public static var count: Cardinal { 2 }

    /// Ordinal of this value (0: msb, 1: lsb).
    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .msb: 0
        case .lsb: 1
        }
    }

    /// Creates a value from its ordinal without bounds checking.
    ///
    /// - Parameter __unchecked: Marker parameter indicating unchecked access.
    /// - Parameter ordinal: Must be 0 (msb) or 1 (lsb).
    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = [.msb, .lsb][ordinal]
    }
}
