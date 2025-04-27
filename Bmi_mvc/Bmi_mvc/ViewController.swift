//
//  ViewController.swift
//  Bmi_mvc
//
//  Created by Mukund Sai Ramavath on 3/25/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var HfeetOL: UITextField!
    
    
    @IBOutlet weak var HinchesOL: UITextField!
    
    @IBOutlet weak var WLbsOL: UITextField!
    
    var feet = 0
    var inches = 0
    var lbs = 0.0
    var bmi = 0.0
    var result = ""
    var imgName = ""
    var category = ""
    var healthadvice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func CalculateBtn(_ sender: UIButton) {
        // read input and typecast to integer
        feet = Int(HfeetOL.text!)!
        inches = Int(HinchesOL.text!)!
        lbs = Double(WLbsOL.text!)!
        
        var height = feet * 12 + inches
        
        bmi = 703 * lbs / (Double(height * height))
        
        if bmi < 18.5 {
            imgName = "underWeight"
            category = "Underweight"
            healthadvice = "Eat more protein and healthy fats."
        }
        else if bmi >= 18.5 && bmi < 25 {
            imgName = "normal"
            category = "Normal"
            healthadvice = "Maintain a balanced diet."
        }
        else if bmi >= 25 && bmi < 30 {
            imgName = "overWeight"
            category = "Overweight"
            healthadvice = "Eat less processed foods and increase physical activity."
        }
        else {
            imgName = "obese"
            category = "Obese"
            healthadvice = "Prioritize weight loss and maintain a healthy diet."
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var transition = segue.identifier
        if transition == "resultSegue" {
            var destination = segue.destination as! ResultViewController
            destination.enteredHfeet = feet
            destination.enteredHinches = inches
            destination.enteredWLbs = lbs
            destination.bmiResult = bmi
            destination.categoryMessage = category
            destination.healthmessage = healthadvice
            destination.bmiImageName = imgName
        }
        
    }
    
}

