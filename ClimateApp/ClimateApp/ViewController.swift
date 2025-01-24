//
//  ViewController.swift
//  ClimateApp
//
//  Created by Mukund Sai Ramavath on 1/23/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var imageViewOL: UIImageView!
    
    @IBOutlet weak var displayOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtnClicked(_ sender: Any) {
        //read the temperature
        var temp = inputOL.text!
        // Convert String into double
        var temperature = Int(temp)!
        
        if (temperature > 60){
            displayOL.text = ("the temperature is \(temperature) its hot🔥")
            imageViewOL.image = UIImage(named: "hot")
        }
        else {
            displayOL.text=("the temperature is \(temperature) its cold🥶")
            imageViewOL.image = UIImage(named : "cool")
        }
        
        
        // Cjeck whether its hot or ccold
        // temp>60 itas hot else cold with image
    }
    
}

