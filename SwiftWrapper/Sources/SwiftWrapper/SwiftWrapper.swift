import RustCore

public func rustAdd(_ lhs: UInt, _ rhs: UInt) -> UInt {
  rust_add(lhs, rhs)
}
