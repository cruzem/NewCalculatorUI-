//
//  File.swift
//  Calculator
//
//  Created by Manny Cruz on 2/1/17.
//  Copyright © 2017 devPro. All rights reserved.
//

import UIKit
import Foundation

enum MathOperation {
    case Multiply, Division, Addition, Subtract, Empty
}

enum CalculatorLogic {
    case PercentPressed(Bool), PlusMinusPressed(Bool), ClearButtonPressed(Bool), OperationSelected(MathOperation), EqualButtonPressed(Bool)
}


class Operation {
    var _firstSet: String!
    var _secondSet: String!
    var _result: Double! = 0.0
    var _runningNumber: String! = ""
    
    var firstSet: String {
        get {
            return _firstSet
        } set {
            _firstSet = newValue
        }
    }
    
    var secondSet: String {
        get {
            return _secondSet
        } set {
            _secondSet = newValue
        }
    }
    
    var result: Double {
        get {
            return _result
        } set {
            _result = newValue
        }
    }
    
    var runningNumber: String {
        get {
            return _runningNumber
        } set {
            _runningNumber = newValue
        }
    }
    
}


    extension MathOperation {
        init(action: MathOperation) {
            switch action {
                case .Multiply:
                    self = .Multiply
                case .Division:
                    self = .Division
                case .Addition:
                    self = .Addition
                case .Subtract:
                    self = .Subtract
                case .Empty:
                    self = .Empty
            }
        }
    }

    extension Double {
        struct Number {
            static var formatter = NumberFormatter()
        }
        
        var scientificStyle: String {
            Number.formatter.numberStyle = .scientific
            Number.formatter.exponentSymbol = "e"
            return Number.formatter.string(from: NSNumber(value: self)) ?? description
        }
        
        var sizeLimit: String {
            Number.formatter.maximumIntegerDigits = 10
            return Number.formatter.string(from: NSNumber(value: self)) ?? description
        }
        
        var decimalStyle: String {
            Number.formatter.numberStyle = .decimal
            return Number.formatter.string(from: NSNumber(value: self)) ?? description
        }
    }





