//
//  ViewController.swift
//  VowelsApp
//
//  Created by Mukund Sai Ramavath on 1/28/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var displayOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func submitbTN(_ sender: UIButton) {
        
        var input=inputOL.text!
        //var output=displayOL.text!
        if (input == "a" || input == "e" || input == "i" || input == "o" || input == "u")
        {
            displayOL.text =  "The given Alphabet  is Vowel"
        }
        else {
            displayOL.text = "The given Alphabet is Consonant"
        }
    
    }
    
}

