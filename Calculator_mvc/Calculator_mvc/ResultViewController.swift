//
//  ResultViewController.swift
//  Calculator_mvc
//
//  Created by Mukund Sai Ramavath on 3/27/25.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var enteredPrincipal: UILabel!
    
    
    @IBOutlet weak var enteredRate: UILabel!
    
    @IBOutlet weak var enteredTime: UILabel!
    
    @IBOutlet weak var resultOL: UILabel!
    
    
    @IBOutlet weak var imageOL: UIImageView!
    
    var prinicpal:Double = 0
       var roi:Double = 0
       var time:Double = 0
       var si:Double = 0
       var category:String!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enteredPrincipal.text = String(format:"Entered prinicipal : %.2f",(Double(prinicpal))]
              resultOL.text = String(format:"Entered Rate of Interest : %.2f",Double(roi))
        enteredTime.text = String(format:"Entered time : %.2f",Double(time))
        resultOL.text = String(format: """
                  The Calculated Simple Interest is : %.2f
                  Simple Interest category : %@
                  """, Double(si), String(category))
        imageOL.alpha = 0.0
              UIView.animate(withDuration: 2, animations: {
                  self.imageOL.alpha = 1.0
                      })
        imageOL.image = UIImage(named: category)

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
