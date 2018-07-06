//
//  ViewController.swift
//  Calculator_practice`
//
//  Created by user on 2018. 6. 22..
//  Copyright © 2018년 user. All rights reserved.
//

import UIKit

extension String {
    var isNumeric: Bool {
        guard self.characters.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self.characters).isSubset(of: nums)
    }
}

extension String {
    var expression: NSExpression {
        return NSExpression(format: self)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var currentNumber : String = ""
    var numberArray: [String] = []
    var temp : String = ""
    var result : Double = 0.0

    
    
    @IBAction func keyboard(_ sender: UIButton) {
        if let uwrappedText = sender.titleLabel?.text {
            if uwrappedText.isNumeric {
                currentNumber +=  uwrappedText
                label.text = currentNumber
            }
        
        if sender.titleLabel?.text == "C" {
            label.text = ""
            currentNumber = ""
            numberArray = []
            result = 0.0
        }
            if !(uwrappedText.isNumeric) &&
            uwrappedText != "=" &&
            uwrappedText != "C" {
            numberArray.append(currentNumber + (uwrappedText))
            label.text = ""
            currentNumber = ""
            }
    
            
        if let uwrappedText = sender.titleLabel?.text {
            if !(uwrappedText.isNumeric) &&
                uwrappedText != "=" &&
                uwrappedText != "C" {
                numberArray.append(currentNumber + (uwrappedText))
                label.text = ""
                currentNumber = ""
            }
        }
        if !((sender.titleLabel?.text)!.isNumeric) &&
            sender.titleLabel?.text != "=" &&
            sender.titleLabel?.text != "C" {
            numberArray.append(currentNumber + (sender.titleLabel?.text)!)
            label.text = ""
            currentNumber = ""
        }
         
        if sender.titleLabel?.text == "=" {
            numberArray.append(currentNumber)
            for value in numberArray {
                temp += value
            }
//            if let intAvgResult : Double = temp.expression.expressionValue(with: nil, context: nil) as? Double {
//                result = intAvgResult
//            }
            
            label.text = String(temp)
            numberArray = []
            numberArray.append(label.text!)
            currentNumber = ""
            result = 0.0
            temp = ""
            
        }
    }
    }
    
}

