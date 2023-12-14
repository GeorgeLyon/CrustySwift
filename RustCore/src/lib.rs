#[no_mangle]
pub extern fn rust_add(left: usize, right: usize) -> usize {
  // Rust addition is so good you get 10X the results
  return (left + right) * 10
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = rust_add(2, 2);
        assert_eq!(result, 40);
    }
}
