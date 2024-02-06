import XCTest
@testable import CalculatorApp

final class CalculatorAppTests: XCTestCase {
    
    var arithmeticController: ArithmeticOperationsController!
    
    override func setUpWithError() throws {
        super.setUp()
        arithmeticController = ArithmeticOperationsController()
    }

    override func tearDownWithError() throws {
        arithmeticController = nil
        super.tearDown()
    }
    
    func testAddition() {
        arithmeticController.firstNumber = "3"
        arithmeticController.secondNumber = "4"
        arithmeticController.calculatorOperation = CalculatorOperation.add
        
        arithmeticController.didSelectOperation(CalculatorOperation.add)
        let result = arithmeticController.performOperation(Double(arithmeticController.firstNumber)!, Double(arithmeticController.secondNumber)!)
        XCTAssertEqual(result, 7)
    }
    
    func testSubtraction() {
        arithmeticController.firstNumber = "7"
        arithmeticController.secondNumber = "5"
        arithmeticController.calculatorOperation = CalculatorOperation.subtract
        
        arithmeticController.didSelectOperation(CalculatorOperation.subtract)
        let result = arithmeticController.performOperation(Double(arithmeticController.firstNumber)!, Double(arithmeticController.secondNumber)!)
        XCTAssertEqual(result, 2)
    }
    
    
}
