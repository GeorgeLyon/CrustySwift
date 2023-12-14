# Crusty Swift

A proof-of-concept **C**apn' Proto, **Rust** and **Swift** powered application.

The idea is to use Rust to implement the core of an application. This core can be shared across multiple platforms (Android, Windows, Linux, even Web via WASM) using Rust's mature cross-platform capabilities. This Rust core is wrapped in a Swift package, such that consumers of the Swift package do not need to care about the Rust implementation. This allows a UI layer to be developed entirely in Swift using native components and frameworks (such as SwiftUI). Other platforms leverage the core in a similar manner and use their own platform-native UI layers.

Normally, such an approach utilizing FFI would be quite fragile and costly to maintain as any engineer who has ever dealt with JNI or a C binding layer can attest. The way we solve this problem is by adopting an RPC-style communication architecture. This limits the surface area of the binding layer to just sending a message and recieving a response. Capn' Proto already has good support for RPC-style interactions and I'm reasonably confident it can be augmented to run with very little overhead within a single process, similar to what this project demonstrates.

The remaining challenges are the Capn' Proto does not yet have a Swift backend and that we are only using the serialization layer, not the RPC capabilities. Both of these would need to be developed before this is a viable approach, but given the diversity of backends available for Capn' Proto, I have high confidence this could be achieved with only modest engineering investment. It is also possible to fall back to a different serialization framework (like Protocol Buffers or Thrift) which do have robust support for Swift and other platforms.

# Building the Project

## Dependencies

- Swift 5.9 (ships with Xcode 15)
- A recent [Rust](https://www.rust-lang.org) version
- [Capn' Proto](https://capnproto.org)

## Building the Rust Core

`make -C RustCore`

## Building/Testing the Swift Wrapper

`swift test --package-path SwiftWrapper`
