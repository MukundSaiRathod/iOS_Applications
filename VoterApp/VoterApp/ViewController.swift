//
//  ViewController.swift
//  VoterApp
//
//  Created by Mukund Sai Ramavath on 1/23/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var imageviewOL: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func eligibilityBtnClicked(_ sender: UIButton) {
        // store the data
        var input = inputOL.text!
        // convert into double
        var age:Double = Double(input)!
        
        if (age > 18){
            display.text = "You are Eligible to Vote 👍🏻"
            imageviewOL.image = UIImage(named :"eligible")
        }
        else {
            display.text = "You are Not Eligible to Vote 👎🏻"
            imageviewOL.image = UIImage(named : "declined")
        }
    }
    
}

