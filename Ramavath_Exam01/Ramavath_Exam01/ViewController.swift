//
//  ViewController.swift
//  Ramavath_Exam01
//
//  Created by Mukund Sai Ramavath on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputPM25: UITextField!
    
    @IBOutlet weak var inputPM10: UITextField!
    
    @IBOutlet weak var imageInput: UIImageView!
    
    @IBOutlet weak var displayOL: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkBtnClicked(_ sender: UIButton) {
        // take the inputs and store them in variables
        // calculate the Air quality     AQC=(PM2.5+PM10)/2
        
        let pm25Text = inputPM25.text ?? ""  // Updated name
        let pm10Text = inputPM10.text ?? ""  // Updated name
                
                if pm25Text.isEmpty || pm10Text.isEmpty {
                    displayOL.text = "Please enter the input values for PM2.5 and PM10."  // Updated name
                    imageInput.image = nil  // Updated name
                    return
                }
                
                if let pm25 = Double(pm25Text), let pm10 = Double(pm10Text) {
                    let aqc = (pm25 + pm10) / 2
                    let roundedAQC = String(format: "%.1f", aqc)
                    var category = ""
                    var imageName = ""
                    var emoji = ""
                    
                    if aqc < 50 {
                        category = "best👍"
                        imageName = "Best"
                        emoji = ""
                    } else if aqc >= 50 && aqc < 100 {
                        category = "moderate"
                        imageName = "Moderate"
                        emoji = "😕"
                    } else {
                        category = "poor"
                        imageName = "Poor"
                        emoji = "😢"
                    }
                    
                    displayOL.text = "The AQC value is \(roundedAQC)\nThis air quality is considered to be \(category) quality air\(emoji)."  // Updated name
                    imageInput.image = UIImage(named: imageName)  // Updated name
                } else {
                    displayOL.text = "Please enter the valid numeric values for PM2.5 and PM10."  // Updated name
                    imageInput.image = nil  // Updated name
                }
        
    }
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        resetFields()
            }
            func resetFields() {
                inputPM25.text = ""  // Updated name
                inputPM10.text = ""  // Updated name
                displayOL.text = ""  // Updated name
                imageInput.image = nil  // Updated name
            }
        
    
}

