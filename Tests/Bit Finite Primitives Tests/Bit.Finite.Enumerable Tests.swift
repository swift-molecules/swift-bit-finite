import Bit_Finite_Primitives
import Testing

@Suite("Bit Finite.Enumerable")
struct BitFiniteEnumerableTests {
    @Suite struct BitValue {}
    @Suite struct BitOrder {}
}

// MARK: - Bit

extension BitFiniteEnumerableTests.BitValue {
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

// MARK: - Bit.Order

extension BitFiniteEnumerableTests.BitOrder {
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
