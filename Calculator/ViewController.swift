//
//  ViewController.swift
//  Calculator
//
//  Created by Manny Cruz on 1/26/17.
//  Copyright © 2017 devPro. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    private var currentOperation: MathOperation = .Empty
    private var operation = Operation()
    private var equalsButtonPressed: Bool = false
    
    @IBOutlet weak var runningLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func divide(_ sender: UIButton) {
        if operation.runningNumber != "" {
            calculation(MathOperation.Division)
        }
        
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        if operation.runningNumber != "" {
            calculation(MathOperation.Multiply)
        }
        
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        if operation.runningNumber != "" {
            calculation(MathOperation.Subtract)
        }
    }
    
    @IBAction func add(_ sender: UIButton) {
        if operation.runningNumber != "" {
            calculation(MathOperation.Addition)
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if operation.runningNumber.characters.count < 9 {
            operation.runningNumber += String(sender.tag)
                    runningLabel.text = String(describing: Double(operation.runningNumber)!.decimalStyle)
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        operation.runningNumber = ""
        operation.firstSet = ""
        operation.secondSet = ""
        operation.result = 0.0
        runningLabel.text = "0"
        currentOperation = .Empty
        equalsButtonPressed = false
    }
    
    @IBAction func equalsButtonPressed(_ sender: Any) {
        if currentOperation != .Empty && operation.runningNumber != "" {
            operation.secondSet = operation.runningNumber
            _ = mathCalculation()
            runningLabel.text = String(operation.result)
            operation.runningNumber = ""
            operation.firstSet = ""
            operation.secondSet = ""
            currentOperation = .Empty
            equalsButtonPressed = true
        }
    }
    
    func calculation(_ oper: MathOperation) {
        if currentOperation != .Empty {
            
            if operation.runningNumber != "" {
    
                operation.secondSet = operation.runningNumber
                operation.runningNumber = ""
                
                _ = mathCalculation()
                
                operation.firstSet = String(operation.result)
                runningLabel.text = String(operation.result)
            }
            currentOperation = oper
        } else if !equalsButtonPressed {
            operation.firstSet = operation.runningNumber
            operation.runningNumber = ""
            currentOperation = oper
        } else if equalsButtonPressed {
            operation.firstSet = String(operation.result)
            currentOperation = oper
        }
    }
    
    func mathCalculation() -> MathOperation {
        if currentOperation == MathOperation.Division  {
            operation.result = Double(operation.firstSet)! / Double(operation.secondSet)!
            return currentOperation
        } else if currentOperation == MathOperation.Multiply {
            operation.result = Double(operation.firstSet)! * Double(operation.secondSet)!
            return currentOperation
        } else if currentOperation == MathOperation.Subtract {
            operation.result = Double(operation.firstSet)! - Double(operation.secondSet)!
            return currentOperation
        } else if currentOperation == MathOperation.Addition {
            operation.result = Double(operation.firstSet)! + Double(operation.secondSet)!
            return currentOperation
        }
            return currentOperation
    }
    
    @IBAction func plusMinusButton(_ sender: Any) {
    }
    
}

