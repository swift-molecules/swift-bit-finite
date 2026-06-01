# ``Bit_Finite_Primitives``

@Metadata {
    @DisplayName("Bit Finite Primitives")
    @TitleHeading("Swift Primitives")
}

Bit's finite-enumerability: the `Finite.Enumerable` witnesses for `Bit` and `Bit.Order`.

## Overview

This package is the integration bridge between `swift-bit-primitives` (the recipient
domain — `Bit` / `Bit.Order`) and `swift-finite-primitives` (the capability provider —
`Finite.Enumerable`). It conforms `Bit` and `Bit.Order` to `Finite.Enumerable` (`count`,
`ordinal`, `init(_unchecked:ordinal:)`) without either base package depending on the
other — keeping `Finite` out of `swift-bit-primitives`' dependency closure.

`Finite.Enumerable` is a *capability*, not part of `Bit`'s identity, so the conformance
lives here in a recipient-owned bridge (mirroring `swift-bit-algebra-primitives`, which
carries `Bit`'s ℤ/2ℤ field witness) rather than inside `bit-primitives`.

Both `Bit` (`.zero` / `.one`) and `Bit.Order` (`.msb` / `.lsb`) are two-element finite
enumerable types, indexed by `ordinal` in `0...1`.

## Topics

### Finite-Enumerable Conformances

- ``Bit``
