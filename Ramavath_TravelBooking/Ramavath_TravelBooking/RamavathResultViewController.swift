//
//  RamavathResultViewController.swift
//  Ramavath_TravelBooking
//
//  Created by Mukund Sai Ramavath on 4/16/25.
//

import UIKit

class RamavathResultViewController: UIViewController {
    
    @IBOutlet weak var imageOL: UIImageView!
    @IBOutlet weak var travellerNameOL: UILabel!
    @IBOutlet weak var noOfTravellersOL: UILabel!
    @IBOutlet weak var cabinTypeOL: UILabel!
    @IBOutlet weak var totalCostOL: UILabel!
    @IBOutlet weak var resultOL: UILabel!
    
    var travellerName: String = ""
    var noOfTravellers: Int = 0
    var classType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultUI()
    }
    
    private func resultUI() {
        travellerNameOL.text = "Traveller Name: \(travellerName)"
        noOfTravellersOL.text = "No. of Guests: \(noOfTravellers)"
        
        // Check if class type is empty or invalid
        if classType.isEmpty || (classType.lowercased() != "economy" && classType.lowercased() != "luxury") {
            // Invalid or missing class type
            cabinTypeOL.text = "Class Type: "
            resultOL.text = "Please select a valid class"
            totalCostOL.text = "Total Cost:"
            imageOL.image = UIImage(named: "invalid") // Invalid class image
        } else {
            // Valid class type
            cabinTypeOL.text = "Class Type: \(classType.lowercased().capitalized)"
            
            var totalCost = 0
            switch classType.lowercased() {
            case "economy":
                totalCost = noOfTravellers * 150
                totalCostOL.text = "Total Cost: $\(totalCost)"
                resultOL.text = "Enjoy your Economy Trip!"
                imageOL.image = UIImage(named: "economy")
                
            case "luxury":
                totalCost = noOfTravellers * 250
                totalCostOL.text = "Total Cost: $\(totalCost)"
                resultOL.text = "Enjoy your Luxury Trip!"
                imageOL.image = UIImage(named: "luxury")
                
            default:
                // If for some reason an invalid class is passed, we still show the invalid page.
                totalCostOL.text = "Total Cost:"
                resultOL.text = "Please select a valid class"
                cabinTypeOL.text = "Class Type:"
                imageOL.image = UIImage(named: "invalid")
            }
        }
    }
}
