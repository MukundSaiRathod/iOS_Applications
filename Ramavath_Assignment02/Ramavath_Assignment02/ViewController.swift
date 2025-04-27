//
//  ViewController.swift
//  Ramavath_Assignment02
//
//  Created by Mukund Sai Ramavath on 2/3/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var billAmountOutlet: UITextField!
    
    @IBOutlet weak var tipPercentageOutlet: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var billAmountLabel: UILabel!
    
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SubmitBTN(_ sender: Any) {
        // store the variables
        var name = nameOutlet.text!
        var billAmount = Double(billAmountOutlet.text!)!
        var tipPercentage = Double(tipPercentageOutlet.text!)!
        var tipAmount = Double(billAmount * tipPercentage / 100)
        var totalAmount = billAmount + tipAmount
        
        nameLabel.text! = "Name: \(name)"
        billAmountLabel.text! = "Bill Amount: $\(billAmount)"
        tipAmountLabel.text! = "Tip Amount: $\(tipAmount)"
        totalAmountLabel.text! = "Total Amount: $\(totalAmount)"
        // assign them to the values
        //display them 
    }
    
    @IBAction func ResetBTN(_ sender: Any) {
        nameLabel.text! = ""
        billAmountLabel.text! = ""
        tipAmountLabel.text! = ""
        totalAmountLabel.text! = ""
    }
}

