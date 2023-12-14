import RustCore
import Schemas

public func rustAdd(_ lhs: UInt, _ rhs: UInt) -> UInt {
  rust_add(lhs, rhs)
}

public func capnpAdd(_ lhs: UInt64, _ rhs: UInt64) -> UInt {
  let request = Request(lhs: lhs, rhs: rhs)
  let requestBuffer: [UInt8]
  do {
    // Encode request
    var context = capn()
    capn_init_malloc(&context)
    defer { capn_free(&context) }
    let root = capn_root(&context)
    let segment = root.seg
    let pointer = new_Request(segment)
    withUnsafePointer(to: request) {
      write_Request($0, pointer)
    }
    capn_setp(capn_root(&context), 0, pointer.p)
    
    let buffer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 32)
    let bytesWritten = capn_write_mem(&context, buffer.baseAddress, buffer.count, 0 /* packed */);
    requestBuffer = Array(buffer.prefix(Int(bytesWritten)))
    buffer.deallocate()
  }


  let response: Response
  do {
    // Get response 
    let buffer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 32)
    defer { buffer.deallocate() }
    requestBuffer.withUnsafeBufferPointer { requestBytes in
      rust_capnp_add(requestBytes.baseAddress!, .init(requestBytes.count), buffer.baseAddress!, .init(buffer.count))
    }
    
    // Decode response
    var context = capn()
    capn_init_mem(&context, buffer.baseAddress!, buffer.count, 0);
    defer { capn_free(&context) }
    var pointer = Response_ptr()
    pointer.p = capn_getp(capn_root(&context), 0, 1);
    var mutableResponse = Response()
    read_Response(&mutableResponse, pointer)
    response = mutableResponse
  }
  
  return .init(response.capnpSum)
}
