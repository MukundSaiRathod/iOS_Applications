//
//  ViewController.swift
//  InitialsApp
//
//  Created by Mukund Sai Ramavath on 1/30/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputFname: UITextField!
    
    
    @IBOutlet weak var inputLname: UITextField!
    
    @IBOutlet weak var diplayOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func BtnClicked(_ sender: UIButton) {
        //store the outlets in variables
        var fname=inputFname.text!
        var lname=inputLname.text!
        
        //we need to get first letter of firstname and first letter of last in Upper case
        var lastinitial=lname.prefix(1).uppercased()
        var firstinitial=fname.prefix(1).uppercased()
        diplayOL.text="Your Initials are \(firstinitial) , \(lastinitial)"
        
    }
    
}

