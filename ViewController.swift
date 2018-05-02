//
//  ViewController.swift
//  FinalCalculator
//
//  Created by adel on 4/14/18.
//  Copyright © 2018 adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddelOfTyping = false
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var dotIsSelectedOnce = false
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddelOfTyping {
        let textCurrentlyInDisplay = display.text!
            if digit == "." {
                if dotIsSelectedOnce == false {
                    display.text = textCurrentlyInDisplay + digit
                    dotIsSelectedOnce = true
                }
            }else{
                display.text = textCurrentlyInDisplay + digit
            }
        }else{
            if digit == "." && dotIsSelectedOnce == false{
                display.text = "0" + digit
                dotIsSelectedOnce = true
                userIsInTheMiddelOfTyping = true
            }else{
                display.text = digit
                userIsInTheMiddelOfTyping = true
            }
        }
    }
    @IBAction func clear(_ sender: UIButton) {
        display.text! = "0"
        userIsInTheMiddelOfTyping = false
        dotIsSelectedOnce = false
        brain.clear()
    }
    var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = 	String(newValue	)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddelOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddelOfTyping = false
            dotIsSelectedOnce = false
        }
        if let mathmaeticalSymbol = sender.currentTitle {
            brain.performOperation(mathmaeticalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }

}

