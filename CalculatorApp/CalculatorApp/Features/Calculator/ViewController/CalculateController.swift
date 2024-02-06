
import Foundation

class CalculateController {
   
    
    private(set) lazy var calculatorHeaderLabel: String = self.firstNumber ?? "0"
    private(set) var currentNumber: CurrentNumber = .firstNumber
    
    private(set) var firstNumber: String? = nil {
        didSet {
            self.calculatorHeaderLabel = self.firstNumber ?? "0"
            output.self.updateViews()
        }
    }
   private(set) var secondNumber: String? = nil {
        didSet {
            self.calculatorHeaderLabel = self.secondNumber ?? "0"
            self.updateViews?()
        }
    }

    private(set) var previousNumber: String? = nil
    private(set) var previousOperation: CalculatorOperation? = nil
    
    
    private(set) var firstNumberIsDecimal: Bool = false
    private(set) var secondNumberIsDecimal: Bool = false
    var eitherNumberIsDecimal: Bool {
      return firstNumberIsDecimal || secondNumberIsDecimal
    }
    
    private weak var output: CalculatorOutput?
}

extension CalculateController:
