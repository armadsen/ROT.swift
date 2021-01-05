import XCTest

import ROT13Tests

var tests = [XCTestCaseEntry]()
tests += ROT13Tests.allTests()
XCTMain(tests)
