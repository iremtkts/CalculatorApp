

import Foundation

public enum CalculatorButtons: Equatable {
    case allClear
    case plusMinus
    case percentage
    case divide
    case multiply
    case subtract
    case add
    case equal
    case number(Int)
    case decimal
    
    init(calculatorButton: CalculatorButtons) {
        self = calculatorButton
    }
}

extension CalculatorButtons {
   
    var title: String {
        switch self {
        case .allClear:
            return "AC"
        case .plusMinus:
            return "+/-"
        case .percentage:
            return "%"
        case .divide:
            return "/"
        case .multiply:
            return "*"
        case .subtract:
            return "-"
        case .add:
            return "+"
        case .equal:
            return "="
        case .number(let int):
            return int.description
        case  .decimal:
            return "."
        }
    }
}

