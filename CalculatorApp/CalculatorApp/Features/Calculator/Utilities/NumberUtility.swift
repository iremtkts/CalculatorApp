

import Foundation

class NumberUtility {
    
    static func toInt(_ doubleNum: Double) -> Int? {
        return Int(doubleNum)
    }
    
    static func toDouble(_ stringValue: String) -> Double? {
        return Double(stringValue)
    }
    
    static func isInteger<T: FloatingPoint>(_ value: T) -> Bool {
        return value.rounded() == value
    }
}
