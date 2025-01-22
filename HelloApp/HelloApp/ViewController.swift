//
//  ViewController.swift
//  HelloApp
//
//  Created by Mukund Sai Ramavath on 1/21/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var displayOL: UILabel!
    
    override func viewDidLoad() {
                 
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }

    @IBAction func submitBtnClicked(_ sender: Any) {
        // read the text field or user data
        // stire it in a variable
        var name = inputOL.text!
        
        displayOL.text="Hello \(name)"
    }
    
    
   
}

