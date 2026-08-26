# Bit Finite

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Retroactive `Finite.Enumerable` conformances for `Bit` and `Bit.Order`, presenting each as a two-value finite domain with a `Cardinal` count and an `Ordinal` index.

---

## Quick Start

`Bit` is a two-value enum (`.zero` / `.one`) and `Bit.Order` is a two-value enum (`.msb` / `.lsb`). This package conforms both to `Finite.Enumerable`, the protocol for types with finitely many indexed inhabitants: each value gains a `static count` (a `Cardinal`), an `ordinal` (an `Ordinal` in `0..<count`), and an unchecked ordinal initializer. The conformance is an isomorphism with `Ordinal<count>` — `ordinal` maps a value to its index, and `init(_unchecked:ordinal:)` maps an index back to a value.

```swift
import Bit_Finite

// Each type reports how many values it has, as a Cardinal.
Bit.count              // 2
Bit.Order.count        // 2

// Every value carries a unique ordinal in 0..<count.
Bit.zero.ordinal       // 0
Bit.one.ordinal        // 1
Bit.Order.msb.ordinal  // 0
Bit.Order.lsb.ordinal  // 1

// The unchecked initializer is the inverse: ordinal back to value.
Bit(_unchecked: (), ordinal: 0) == .zero          // true
Bit.Order(_unchecked: (), ordinal: 1) == .lsb     // true
```

Because both types satisfy `Finite.Enumerable`, they also inherit the protocol's safe, total `init?(_ ordinal:)` (returns `nil` outside `0..<count`) and a zero-allocation `allCases` collection — and any generic algorithm written against `Finite.Enumerable` now accepts `Bit` and `Bit.Order` directly.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-bit-finite.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Bit Finite", package: "swift-bit-finite"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. The conformance composes four primitives: `Bit` (and its standard-library integration), `Finite.Enumerable`, `Cardinal`, and `Ordinal`.

| Product | Target | Purpose |
|---------|--------|---------|
| `Bit Finite` | `Sources/Bit Finite/` | Conforms `Bit` and `Bit.Order` to `Finite.Enumerable` (`count` / `ordinal` / `init(_unchecked:ordinal:)`); re-exports `Bit`, `Cardinal`, `Ordinal`, and the `Finite.Enumerable` protocol. |
| `Bit Finite Test Support` | `Tests/Support/` | Surfaces the witness to test consumers via `import Bit_Finite`. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
