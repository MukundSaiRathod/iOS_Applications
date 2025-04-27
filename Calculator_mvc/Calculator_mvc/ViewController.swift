//
//  ViewController.swift
//  Calculator_mvc
//
//  Created by Mukund Sai Ramavath on 3/27/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var principalOL: UITextField!
    
    @IBOutlet weak var interestOL: UITextField!
    
    @IBOutlet weak var timeOL: UITextField!
    
    var prinicpal:Double!
        var roi:Double!
        var time:Double!
        var si:Double!
        var category:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
     
    @IBAction func calculateBtnClicked(_ sender: Any) {
        // store the outlets in variables and convert to double
        prinicpal = Double(principalOL.text!)
                roi = Double(interestOL.text!)
                time = Double(timeOL.text!)
                
                si = (prinicpal * roi * time)/100
                if(si<100)
                {
                    category = "Low"
                }
                else if(si>=100 && si<500)
                {
                    category = "Medium"
                }
                else
                {
                    category = "High"
                }
            }
            
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                var transition = segue.identifier
                if transition == "ResultSegue"{
                    var destination = segue.destination as! ResultViewController
                    destination.prinicpal = prinicpal
                    destination.roi = roi
                    destination.time = time
                    destination.si = si
                    destination.category = category
                }
    }
    

}

