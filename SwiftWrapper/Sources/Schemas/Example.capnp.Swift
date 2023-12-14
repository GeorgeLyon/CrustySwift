/*
This Schema is currently implemented manually from the output of `capnp -ocapnp` below. We would need to create a Swift capnp plugin to do this automatically.

```capnp
# Schemas/Example.capnp
@0xb9140af573b0dcf4;
struct Request @0xc930e432eed13062 {  # 16 bytes, 0 ptrs
  lhs @0 :UInt64;  # bits[0, 64)
  rhs @1 :UInt64;  # bits[64, 128)
}
struct Response @0x98a5cdac5d982352 {  # 16 bytes, 0 ptrs
  boringSum @0 :UInt64;  # bits[0, 64)
  rustSum @1 :UInt64;  # bits[64, 128)
}
```
*/

struct Request {
  init(_ lhs: UInt64, _ rhs: UInt64) {
    precondition(MemoryLayout<Self>.size == 16)
    precondition(MemoryLayout<Self>.offset(of: \.lhs) == 0)
    precondition(MemoryLayout<Self>.offset(of: \.rhs) == 8)
    self.lhs = lhs
    self.rhs = rhs
  }

  private let lhs: UInt64
  private let rhs: UInt64
}

struct Respnose {
  public let boringSum: UInt64
  public let rustSum: UInt64

  public func validateLayout() {
    precondition(MemoryLayout<Self>.size == 16)
    precondition(MemoryLayout<Self>.offset(of: \.boringSum) == 0)
    precondition(MemoryLayout<Self>.offset(of: \.rustSum) == 8)
  }
}
