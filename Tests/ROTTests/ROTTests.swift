import XCTest
@testable import ROT13

final class ROTTests: XCTestCase {
    func testROT13() {
        let rot = ROTAlgorithm()
        XCTAssertEqual(rot.encode("abc"), "nop")
        XCTAssertEqual(rot.encode("nop"), "abc")
    }

    func testROT10() {
        let rot = ROTAlgorithm(rotationDistance: 10)
        XCTAssertEqual(rot.encode("abc"), "klm")
        XCTAssertEqual(rot.decode("klm"), "abc")
    }

    func testROT50() {
        let rot = ROTAlgorithm(rotationDistance: 50)
        XCTAssertEqual(rot.encode("abc"), "yza")
        XCTAssertEqual(rot.decode("yza"), "abc")
    }

    func testManyRotations() {
        let input = "The quick brown fox jumped over the lazy dog!"
        for i in 0...1000 {
            let rot = ROTAlgorithm(rotationDistance: i)
            let encoded = rot.encode(input)
            print(encoded)
            let result = rot.decode(encoded)
            XCTAssertEqual(result, input)
        }
    }

    static var allTests = [
        ("testROT13", testROT13),
        ("testROT10", testROT10),
    ]
}
