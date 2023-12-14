extern crate capnpc;

fn main() {
  capnpc::CompilerCommand::new()
    .output_path("src/")
    .src_prefix("../Schemas")
    .file("../Schemas/example.capnp")
    .run()
    .unwrap();
}
