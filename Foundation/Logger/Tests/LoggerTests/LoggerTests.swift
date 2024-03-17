import XCTest
@testable import Logger

final class LoggerTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let logger = Logger(label: "logger-test")
        logger.log(level: .critical, message: "Hello, World!")
    
    }
}
