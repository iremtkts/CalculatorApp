import UIKit

enum CurrentNumber {
    case firstNumber
    case secondNumber
}

class ArithmeticOperationsController {
    
    var buttons: [CalculatorButtons] = [
            .allClear, .plusMinus, .percentage, .divide,
            .number(7), .number(8), .number(9), .multiply,
            .number(4), .number(5), .number(6), .subtract,
            .number(1), .number(2), .number(3), .add,
            .number(0), .decimal, .equal
        ]

    
    var updateViews: (() -> Void)?
    
    var currentNumber: CurrentNumber = .firstNumber
    var calculatorHeaderLabel: String = ""
    
    var firstNumber: String = "0"

    var secondNumber: String = "0"
    
    var calculatorOperation: CalculatorOperation? {
        didSet {
            if calculatorOperation != nil {
                previousNumber = firstNumber
                previousOperation = calculatorOperation
                currentNumber = .secondNumber
            }
        }
    }
    
    var previousNumber: String = "0"
    var previousOperation: CalculatorOperation?
    
    func updateHeaderLabel() {
        let value = currentNumber == .firstNumber ? firstNumber : secondNumber
        if let doubleValue = NumberUtility.toDouble(value) {
            if doubleValue.isNaN {
                calculatorHeaderLabel = "Hata"
                print("updateHeaderLabel: Hata")
            } else {
                calculatorHeaderLabel = String(format: "%g", doubleValue)
                print("updateHeaderLabel: \(calculatorHeaderLabel)")
            }
        } else {
            calculatorHeaderLabel = value
            print("updateHeaderLabel: \(calculatorHeaderLabel)")
        }
        updateViews?()
    }

    
}



extension ArithmeticOperationsController {
    
    
    func didSelectOperation(_ operation: CalculatorOperation) {
        if currentNumber == .secondNumber {
            guard let firstNum = Double(firstNumber), let secondNum = Double(secondNumber) else { return }
            let result = performOperation(firstNum, secondNum)
            firstNumber = String(result)
            secondNumber = "0"
            currentNumber = .firstNumber
        }
        calculatorOperation = operation
    }
    
    func performOperation(_ first: Double, _ second: Double) -> Double {
        guard let operation = calculatorOperation else { return first }
        
        switch operation {
        case .divide:
            return second == 0 ? Double.nan : first / second
        case .multiply:
            return first * second
        case .subtract:
            return first - second
        case .add:
            return first + second
        }
    }

   
    func didClearButtonPressed() {
        firstNumber = "0"
        secondNumber = "0"
        currentNumber = .firstNumber
        calculatorOperation = nil
        previousNumber = "0"
        previousOperation = nil
        updateHeaderLabel()

    }
    
}



extension ArithmeticOperationsController {
    
    
    func didSelectNumber(_ number: Int) {
        let numberAsString = "\(number)"
        switch currentNumber {
        case .firstNumber:
           firstNumber = firstNumber == "0" ? numberAsString : firstNumber + numberAsString
         case .secondNumber:
           secondNumber = secondNumber == "0" ? numberAsString : secondNumber + numberAsString
        }
        updateHeaderLabel()
       
    }
    
    
    
    func didPressDecimal() {
        switch currentNumber {
        case .firstNumber:
            if !firstNumber.contains(".") {
                firstNumber += "."
            }
        case .secondNumber:
            if !secondNumber.contains(".") {
                secondNumber += "."
            }
        }
        updateHeaderLabel()
       
    }
   
    
    func didEqualButtonPressed() {
        guard let firstNum = Double(firstNumber), let secondNum = Double(secondNumber) else { return }
        let result = performOperation(firstNum, secondNum)

        if result.isNaN {
        calculatorHeaderLabel = "Hata"
        firstNumber = "Hata"
        } else {
          firstNumber = String(result)
        }
        calculatorOperation = nil
        currentNumber = .firstNumber

        updateHeaderLabel()
    
    }




}



extension ArithmeticOperationsController {
    
    func didSelectButton(_ calculatorButton: CalculatorButtons) {
        switch calculatorButton {
        case .number(let number):
            didSelectNumber(number)
        case .allClear:
            didClearButtonPressed()
        case .plusMinus:
            didPressPlusMinusButton()
        case .percentage:
            didPressPercentageButton()
        case .divide:
            didSelectOperation(.divide)
        case .multiply:
            didSelectOperation(.multiply)
        case .subtract:
            didSelectOperation(.subtract)
        case .add:
            didSelectOperation(.add)
        case .equal:
            didEqualButtonPressed()
        case .decimal:
            didPressDecimal()
        }
    
       
    }
        
        
        func didPressPlusMinusButton() {
            switch currentNumber {
            case .firstNumber:
                firstNumber.toggleSign()
            case .secondNumber:
                secondNumber.toggleSign()
            }
            updateHeaderLabel()
          
           
        }
        
     
        func didPressPercentageButton() {
            switch currentNumber {
            case .firstNumber:
                if let value = Double(firstNumber) {
                    firstNumber = String(value / 100)
                }
            case .secondNumber:
                if let value = Double(secondNumber) {
                    secondNumber = String(value / 100)
                }
            }
            updateHeaderLabel()
           
        }
    }

    

    private extension String {
        mutating func toggleSign() {
            if starts(with: "-") {
                remove(at: startIndex)
            } else {
                self = "-" + self
            }
        }
    }

   
