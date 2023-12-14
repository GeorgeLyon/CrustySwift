use capnp::message::Builder;
use capnp::serialize;

#[no_mangle]
pub extern "C" fn rust_add(left: usize, right: usize) -> usize {
    // Rust addition is so good you get 10X the results
    return (left + right) * 10;
}

#[no_mangle]
pub extern "C" fn rust_capnp_add() {
    let mut message = Builder::new_default();

    let mut person = message.init_root::<::george::Builder>();
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
