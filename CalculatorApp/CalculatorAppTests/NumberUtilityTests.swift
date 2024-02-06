
import XCTest
@testable import CalculatorApp

final class NumberUtilityTests: XCTestCase {

    func testIsInteger() {
        XCTAssertTrue(NumberUtility.isInteger(7.0 as Double))
        XCTAssertFalse(NumberUtility.isInteger(7.5 as Double))
        
        XCTAssertTrue(NumberUtility.isInteger(7.0 as Float))
        XCTAssertFalse(NumberUtility.isInteger(7.5 as Float))
    }
    
    func testToInt() {
        let intPositiveValue = NumberUtility.toInt(7.0)
        XCTAssertEqual(intPositiveValue, 7)
        
        let intNegativeValue = NumberUtility.toInt(-7.0)
        XCTAssertEqual(intNegativeValue, -7)
        
        let intZeroNumber = NumberUtility.toInt(0.0)
        XCTAssertEqual(intZeroNumber, 0)
    }
    
    func testToDouble() {
        let intNumberText = NumberUtility.toDouble("5")
        XCTAssertEqual(intNumberText, 5.0)
        
        let decimalNumberText = NumberUtility.toDouble("5.5")
        XCTAssertEqual(decimalNumberText, 5.5)
        
        let stringValue = NumberUtility.toDouble("xyz")
        XCTAssertNil(stringValue)
    }
    
}
