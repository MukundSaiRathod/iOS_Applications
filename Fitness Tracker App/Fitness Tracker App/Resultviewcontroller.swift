//
//  Resultviewcontroller.swift
//  Fitness Tracker App
//
//  Created by Mukund Sai Ramavath on 4/1/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var enteredActivityType: UILabel!
    @IBOutlet weak var enteredDuration: UILabel!
    @IBOutlet weak var enteredCalories: UILabel!
    @IBOutlet weak var enteredTotalCaloriesBurned: UILabel!
    @IBOutlet weak var resultimageView: UIImageView!
    
    var activityType: String = ""
    var duration: Int = 0
    var caloriesPerMin: Int = 0
    var totalCaloriesBurned: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enteredActivityType.text = "Activity Type : \(activityType)"
        enteredDuration.text = "Duration : \(duration) min"
        enteredCalories.text = "Calories per Minute : \(caloriesPerMin)"
        enteredTotalCaloriesBurned.text = "Total Calories Burned : \(totalCaloriesBurned)"
        
        switch activityType.lowercased() {
        case "running":
            resultimageView.image = UIImage(named: "running")
        case "cycling":
            resultimageView.image = UIImage(named: "cycling")
        case "swimming":
            resultimageView.image = UIImage(named: "swimming")
        default:
            resultimageView.image = UIImage(named: "default")
        }
        
        resultimageView.alpha = 0.0
        UIView.animate(withDuration: 1.5) {
            self.resultimageView.alpha = 1.0
        }
    }
    
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


