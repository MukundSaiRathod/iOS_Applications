//
//  ViewController.swift
//  Ramavath_CalculatorApp
//
//  Created by Mukund Sai Ramavath on 2/25/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayOL: UILabel!
    
    
    // Variables for storing values and operator
        var firstNumber: Double = 0
        var secondNumber: Double = 0
        var currentOperator: String = ""
        var isTypingNumber = false

    

    override func viewDidLoad() {
        super.viewDidLoad()
        displayOL.text = "0"
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func btn0(_ sender: Any) {
        appendNumber("0")
    }
    
    @IBAction func btn1(_ sender: Any) {
        appendNumber("1")
    }
    
    @IBAction func btn2(_ sender: Any) {
        appendNumber("2")
    }
    
    @IBAction func btn3(_ sender: Any) {
        appendNumber("3")
    }
    
    @IBAction func btn4(_ sender: Any) {
        appendNumber("4")
    }
    
    
    @IBAction func btn5(_ sender: Any) {
        appendNumber("5")
    }
    
    @IBAction func btn6(_ sender: Any) {
        appendNumber("6")
    }
    
    @IBAction func btn7(_ sender: Any) {
        appendNumber("7")
    }
    
    @IBAction func btn8(_ sender: Any) {
        appendNumber("8")
    }
    
    @IBAction func btn9(_ sender: Any) {
        appendNumber("9")
    }
    
    @IBAction func btndecimal(_ sender: Any) {
        appendNumber(".")
    }
    
    // function for appending numbers
    
    func appendNumber(_ number: String) {
        
        
        if isTypingNumber {
            displayOL.text = displayOL.text! + number
        } else {
            displayOL.text = number
            isTypingNumber = true
        }
    }
    
    // functions for operators
    
   
    @IBAction func btnAdd(_ sender: Any) {
        setOperator("+")
    }
    
    @IBAction func btnSubtract(_ sender: Any) {
        setOperator("-")
    }
    
    @IBAction func btnMultiply(_ sender: Any) {
        setOperator("*")
    }
    
    @IBAction func btnDivide(_ sender: Any) {
        setOperator("/")
    }
    
    
    @IBAction func btnModulus(_ sender: Any) {
        setOperator("%")
    }
    
    func setOperator(_ op: String) {
        firstNumber = Double(displayOL.text!)!
        currentOperator = op
        isTypingNumber = false
    }
    
    
    @IBAction func btnEqual(_ sender: Any) {
        secondNumber = Double(displayOL.text!)!
                var result: Double = 0
                
                switch currentOperator {
                case "+": result = firstNumber + secondNumber
                case "-": result = firstNumber - secondNumber
                case "*": result = firstNumber * secondNumber
                case "/": result = secondNumber == 0 ? Double.nan : firstNumber / secondNumber
                case "%": result = firstNumber.truncatingRemainder(dividingBy: secondNumber)
                default: break
                }
                
        displayOL.text = formatResult(result)
                isTypingNumber = false
    }
    
    @IBAction func btnAllClear(_ sender: Any) {
        firstNumber = 0
                secondNumber = 0
                currentOperator = ""
                displayOL.text = "0"
                isTypingNumber = false
    }
    
    @IBAction func btnClearOne(_ sender: Any) {
        displayOL.text = "0"
                isTypingNumber = false
    }
    
    
    @IBAction func btnSignChange(_ sender: Any) {
        if let value = Double(displayOL.text!) {
            displayOL.text = String(value * -1)
        }
    }
    
    func formatResult(_ result: Double) -> String {
        return result.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(result)) : String(format: "%.2f", result)
    }
    
    
    
    
    
    
    
}

