xcframework: macos ios
	$(RM) -rf target/RustCore.xcframework
	xcodebuild -create-xcframework \
		-library target/_universal-apple-darwin/release/librust_core.a \
		-headers ./include \
		-library target/aarch64-apple-ios/release/librust_core.a \
		-headers ./include \
		-library target/aarch64-apple-ios-sim/release/librust_core.a \
		-headers ./include \
		-output target/RustCore.xcframework

macos:
	@cargo build --release --lib --target aarch64-apple-darwin
	@cargo build --release --lib --target x86_64-apple-darwin
	@rm -rf target/_universal-apple-darwin
	@mkdir -p target/_universal-apple-darwin/release
	@lipo -create -output target/_universal-apple-darwin/release/librust_core.a \
		target/aarch64-apple-darwin/release/librust_core.a \
		target/x86_64-apple-darwin/release/librust_core.a

ios:
	@cargo build --release --lib --target aarch64-apple-ios
	@cargo build --release --lib --target aarch64-apple-ios-sim