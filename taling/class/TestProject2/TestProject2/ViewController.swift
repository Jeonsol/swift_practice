//
//  ViewController.swift
//  TestProject2
//
//  Created by byung-soo kwon on 2018. 6. 18..
//  Copyright © 2018년 ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var display: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var isMiddleOfTyping = false
    var operand = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("초기화될거야")
        for button in buttons {
            button.layer.setAffineTransform(CGAffineTransform(scaleX: 0.9, y: 0.9))
            if button.titleLabel?.text == "0" {
                button.layer.cornerRadius = button.frame.height * 1.1 / 2
            } else {
                button.layer.cornerRadius = button.frame.width * 1.1 / 2
            }
        }
    }
 
    
    func hello2(input: String) {
        switch input {
        case "+": break
        case "-": break
        case "*": break
        case "/": break
        default: break
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        if let digit = sender.currentTitle, let textCurrentDisplay = display.text {
            if isMiddleOfTyping {
                display.text = textCurrentDisplay + digit
            } else {
                display.text = digit
            }
        }
        isMiddleOfTyping = true
    }
    
    
    @IBAction func performAction(_ sender: UIButton) {
        if sender.currentTitle == "+" {
            operand = Double(display.text!)!
        }
        
        if sender.currentTitle == "=" {
            let result = operand + Double(display.text!)!
            display.text = String(result)
        }
        isMiddleOfTyping = false
    }
    
}

