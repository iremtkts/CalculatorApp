import XCTest

final class CalculatorAppUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
       // continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }
    
    func testAddingNumbers() throws {
        app.buttons["button1"].tap()
        app.buttons["button+"].tap()
        app.buttons["button2"].tap()
        app.buttons["button="].tap()
               
        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultLabel.label, "3")
        }
        
    func testSubtractingNumbers() throws {
        app.buttons["button5"].tap()
        app.buttons["button-"].tap()
        app.buttons["button3"].tap()
        app.buttons["button="].tap()

        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultLabel.label, "2")
        }

    func testComplexCalculation() throws {
        app.buttons["button9"].tap()
        app.buttons["button*"].tap()
        app.buttons["button5"].tap()
        app.buttons["button-"].tap()
        app.buttons["button3"].tap()
        app.buttons["button+"].tap()
        app.buttons["button2"].tap()
        app.buttons["button="].tap()

        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultLabel.label, "44")
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
