import XCTest

@testable import SwiftWrapper

final class SwiftWrapperTests: XCTestCase {
  func testExample() throws {
    XCTAssertEqual(2 + 3, 5)
    XCTAssertEqual(rustAdd(2, 3), 50)
    XCTAssertEqual(capnpAdd(2, 3), 500)
  }
}
