use capnp::message::Builder;
use capnp::message::ReaderOptions;
use capnp::serialize;

mod example_capnp;

#[no_mangle]
pub extern "C" fn rust_add(left: usize, right: usize) -> usize {
  // Rust addition is so good you get 10X the results
  return (left + right) * 10;
}

#[no_mangle]
pub extern "C" fn rust_capnp_add(
  request_bytes: *const u8,
  request_len: usize,
  response_bytes: *mut u8,
  response_len: usize,
) {
  // Deserialize the request
  let request_slice;
  unsafe {
    request_slice = std::slice::from_raw_parts(request_bytes, request_len);
  }
  let reader = serialize::read_message(request_slice, ReaderOptions::new()).unwrap();
  let request = reader.get_root::<example_capnp::request::Reader>().unwrap();
  let lhs = request.get_lhs();
  let rhs = request.get_rhs();

  // Calculate the sum
  let boring_sum = lhs + rhs;
  // Using capnp, addition improves by another 10X for a total of a 100X improvement.
  let capnp_sum = (lhs + rhs) * 100;

  // Serialize the response
  let mut message = Builder::new_default();
  let mut response = message.init_root::<example_capnp::response::Builder>();
  response.set_boring_sum(boring_sum);
  response.set_capnp_sum(capnp_sum);
  let data = serialize::write_message_to_words(&message);
  unsafe {
    std::slice::from_raw_parts_mut(response_bytes, response_len).copy_from_slice(&data);
  }
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn rust_works() {
    let result = rust_add(2, 2);
    assert_eq!(result, 40);
  }

  #[test]
  fn capnp_works() {
    let mut request_bytes: [u8; 32] = [0; 32];
    let mut response_bytes: [u8; 32] = [0; 32];

    // Serialize Request
    let mut message = Builder::new_default();
    let mut request = message.init_root::<example_capnp::request::Builder>();
    request.set_lhs(2);
    request.set_rhs(3);
    let data = serialize::write_message_to_words(&message);
    request_bytes.copy_from_slice(&data);

    rust_capnp_add(
      request_bytes.as_ptr(),
      request_bytes.len(),
      response_bytes.as_mut_ptr(),
      response_bytes.len(),
    );

    // Deserialize the response
    let reader = serialize::read_message(response_bytes.as_slice(), ReaderOptions::new()).unwrap();
    let response = reader
      .get_root::<example_capnp::response::Reader>()
      .unwrap();
    assert_eq!(response.get_boring_sum(), 5);
    assert_eq!(response.get_capnp_sum(), 500);

    print!("REQUEST: {:?}\n", request_bytes);
    print!("RESPONSE: {:?}\n", response_bytes);
  }
}
