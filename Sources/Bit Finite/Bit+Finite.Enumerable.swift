public import Bit
public import Bit_Standard_Library_Integration
public import Cardinal
public import Finite
public import Finite_Ordinal
public import Ordinal

extension Bit: @retroactive Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { Cardinal(2) }

    @inlinable
    public var ordinal: Ordinal { Ordinal(UInt(rawValue)) }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = ordinal.rawValue == 0 ? .zero : .one
    }
}

extension Bit.Order: @retroactive Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { Cardinal(2) }

    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .msb: Ordinal(0)
        case .lsb: Ordinal(1)
        }
    }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = ordinal.rawValue == 0 ? .msb : .lsb
    }
}
