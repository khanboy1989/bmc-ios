//
//  DelayedTaskTest.swift
//
//
//  Created by Serhan Khan on 30/03/2024.
//

import XCTest
@testable import Helpers

final class DelayedTaskTest: XCTestCase {
    func testTaskExecutesAfterDelay() throws {
        let positiveExpectation = expectation(description: "Delayed task finished in time")
        let negativeExpectation = expectation(description: "Delayed task finished too early")
        negativeExpectation.isInverted = true

        Task.delayed(seconds: 0.2) {
            positiveExpectation.fulfill()
            negativeExpectation.fulfill()
        }

        wait(for: [negativeExpectation], timeout: 0.1)
        wait(for: [positiveExpectation], timeout: 0.15)
    }
}
