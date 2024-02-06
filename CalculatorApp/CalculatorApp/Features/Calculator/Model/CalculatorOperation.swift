
import Foundation

public enum CalculatorOperation {
    
    case divide
    case multiply
    case subtract
    case add
    
    
    var title:String {
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .divide:
            return "/"
        case .multiply:
            return "x"
        }
    }
}

