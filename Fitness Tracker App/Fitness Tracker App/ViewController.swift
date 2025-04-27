//
//  ViewController.swift
//  Fitness Tracker App
//
//  Created by Mukund Sai Ramavath on 4/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityTypeOL: UILabel!
    @IBOutlet weak var durationOL: UILabel!
    @IBOutlet weak var caloriesBurnedOL: UILabel!
    
    @IBOutlet weak var enteredActivitytypeOL: UITextField!
    @IBOutlet weak var enteredDurationOL: UITextField!
    @IBOutlet weak var enteredCaloriesBurnedOL: UITextField!
    
    @IBOutlet weak var caluclatecaloriesBTN: UIButton!
    @IBOutlet weak var resetBTN: UIButton!
    
    var totalCaloriesBurned: Int = 0
    var activityType: String = ""
    var duration: Int = 0
    var caloriesPerMinute: Int = 0
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            caluclatecaloriesBTN.isEnabled = false
            
            enteredActivitytypeOL.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
            enteredDurationOL.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
            enteredCaloriesBurnedOL.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        }
        
        @objc func textFieldsChanged() {
            if let activity = enteredActivitytypeOL.text, !activity.isEmpty,
               let durationText = enteredDurationOL.text, !durationText.isEmpty,
               let caloriesText = enteredCaloriesBurnedOL.text, !caloriesText.isEmpty {
                caluclatecaloriesBTN.isEnabled = true
            } else {
                caluclatecaloriesBTN.isEnabled = false
            }
        }
   
    
    @IBAction func caluclatecaloriesBTN(_ sender: UIButton) {
        
        if let activity = enteredActivitytypeOL.text,
           let durationText = enteredDurationOL.text, let durationValue = Int(durationText),
           let caloriesText = enteredCaloriesBurnedOL.text, let caloriesValue = Double(caloriesText) {
            
            activityType = activity
            duration = durationValue
            caloriesPerMinute = Int(caloriesValue)
            totalCaloriesBurned = Int(duration) * caloriesPerMinute
            
            
        }
    }
    
    @IBAction func resetBTN(_ sender: UIButton) {
        enteredActivitytypeOL.text = ""
        enteredDurationOL.text = ""
        enteredCaloriesBurnedOL.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            if let destinationVC = segue.destination as? ResultViewController {
                destinationVC.activityType = activityType
                destinationVC.duration = duration
                destinationVC.caloriesPerMin = caloriesPerMinute
                destinationVC.totalCaloriesBurned = totalCaloriesBurned
            }
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Resetting all input fields
        enteredActivitytypeOL.text = ""
        enteredDurationOL.text = ""
        enteredCaloriesBurnedOL.text = ""
            
           
        }

    
}
