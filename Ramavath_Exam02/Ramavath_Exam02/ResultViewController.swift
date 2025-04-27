//
//  ResultViewController.swift
//  Ramavath_Exam02
//
//  Created by Mukund Sai Ramavath on 4/3/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var goalOutputOL: UILabel!
    
    @IBOutlet weak var amountOutputOL: UILabel!
    
    @IBOutlet weak var interestOutputOL: UILabel!
    
    @IBOutlet weak var savingsOutputOL: UILabel!
    
    @IBOutlet weak var imageOutputOL: UIImageView!
    
    var totalMonths: Double = 0.0
    var monthlyInterestRate : Double = 0.0
    var monthlySavingsPayment: Double = 0.0
    var goal: String = ""
    var amount: Double = 0.0
    var interest: Double = 0.0
    var years: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        goalOutputOL.text = "Goal Type: \(goal)"
        amountOutputOL.text = "Target Amount: \(amount)"
        interestOutputOL.text = "Entered Interest Rate: \(interest)"
        savingsOutputOL.text = String(format: "Calculated Savings: %.2f", monthlySavingsPayment)
        
        imageOutputOL.alpha = 0.0
        UIView.animate(withDuration: 1.5) {
            self.imageOutputOL.alpha = 1.0
        }
        imageOutputOL.image = UIImage(named: (goal.lowercased()))
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
