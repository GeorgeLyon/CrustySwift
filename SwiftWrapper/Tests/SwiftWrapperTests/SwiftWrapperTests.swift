import XCTest

@testable import SwiftWrapper

final class SwiftWrapperTests: XCTestCase {
  func testExample() throws {
    XCTAssertEqual(rustAdd(2, 3), 50)
  }
}
