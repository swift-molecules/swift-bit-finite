public import Bit_Primitive
public import Bit_Primitives_Standard_Library_Integration
public import Finite_Enumerable_Primitives

extension Bit: @retroactive Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { Cardinal(2) }

    @inlinable
    public var ordinal: Ordinal { Ordinal(UInt(rawValue)) }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = [.zero, .one][ordinal]
    }
}

extension Bit.Order: @retroactive Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { 2 }

    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .msb: 0
        case .lsb: 1
        }
    }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = [.msb, .lsb][ordinal]
    }
}
