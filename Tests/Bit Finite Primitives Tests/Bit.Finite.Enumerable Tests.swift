import Bit_Finite_Primitives
import Testing

@Suite struct `Bit Finite.Enumerable Tests` {
    @Suite struct Unit {
        @Suite struct `Bit Value` {}
        @Suite struct `Bit Order` {}
    }

    @Suite struct `Edge Case` {}

    @Suite struct Integration {}
}

extension `Bit Finite.Enumerable Tests`.Unit.`Bit Value` {
    @Test
    func `Finite.Enumerable count is 2`() {
        #expect(Bit.count == 2)
    }

    @Test
    func `Finite.Enumerable ordinal values`() {
        #expect(Bit.zero.ordinal == 0)
        #expect(Bit.one.ordinal == 1)
    }

    @Test
    func `Finite.Enumerable init from ordinal unchecked`() {
        #expect(Bit(_unchecked: (), ordinal: 0) == .zero)
        #expect(Bit(_unchecked: (), ordinal: 1) == .one)
    }
}

extension `Bit Finite.Enumerable Tests`.Unit.`Bit Order` {
    @Test
    func `Finite.Enumerable count is 2`() {
        #expect(Bit.Order.count == 2)
    }

    @Test
    func `Finite.Enumerable ordinal values`() {
        #expect(Bit.Order.msb.ordinal == 0)
        #expect(Bit.Order.lsb.ordinal == 1)
    }

    @Test
    func `Finite.Enumerable init from ordinal unchecked`() {
        #expect(Bit.Order(_unchecked: (), ordinal: 0) == .msb)
        #expect(Bit.Order(_unchecked: (), ordinal: 1) == .lsb)
    }
}
