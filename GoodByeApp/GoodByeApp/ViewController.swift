//
//  ViewController.swift
//  GoodByeApp
//
//  Created by Mukund Sai Ramavath on 1/22/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fname: UITextField!
    
    @IBOutlet weak var lname: UITextField!
    
    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtnClick(_ sender: Any) {
        //read input and store them in Variables
        var lname = lname.text!
        var fname = fname.text!
        
        // display the varibale within the output
        display.text = "Hello \(lname) \(fname)!"
    }
    
}

