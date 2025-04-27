//
//  ResultViewController.swift
//  Bmi_mvc
//
//  Created by Mukund Sai Ramavath on 3/25/25.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var EnteredHfeetOL: UILabel!
    
    
    @IBOutlet weak var EnteredHinchesOL: UILabel!
    
    @IBOutlet weak var EnteredWLbsOL: UILabel!
    
    
    @IBOutlet weak var ResultLabelOL: UILabel!
    
    
    @IBOutlet weak var ImageViewOL: UIImageView!
    
    var enteredHfeet = 0
    var enteredHinches = 0
    var enteredWLbs = 0.0
    var bmiResult = 0.0
    var healthmessage = ""
    var bmiImageName = ""
    var categoryMessage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnteredHfeetOL.text = EnteredHfeetOL.text! + String(enteredHfeet)
        EnteredHinchesOL.text = EnteredHinchesOL.text! + String(enteredHinches)
        EnteredWLbsOL.text = EnteredWLbsOL.text! + String(enteredWLbs)
        ResultLabelOL.text = """
BMI Value : \(bmiResult)
Category : \(categoryMessage)
Health Tip : \(healthmessage)
"""
        ImageViewOL.image = UIImage(named: bmiImageName)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
