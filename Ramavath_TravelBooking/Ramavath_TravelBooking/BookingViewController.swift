//
//  ViewController.swift
//  Ramavath_TravelBooking
//
//  Created by Mukund Sai Ramavath on 4/16/25.
//

import UIKit

class BookingViewController: UIViewController {
    
    @IBOutlet weak var travellerNameOL: UITextField!
    @IBOutlet weak var noOfTravellersOL: UITextField!
    @IBOutlet weak var cabinTypeOL: UITextField!
    
    var travellerName = ""
    var noOfTravellers = 0
    var classType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func bookNowButton(_ sender: UIButton) {
        // Validate inputs
            guard let name = travellerNameOL.text, !name.isEmpty,
                  let travellersText = noOfTravellersOL.text, let travellers = Int(travellersText),
                  let cabin = cabinTypeOL.text else {
                return
            }
            
            // Save valid data
            travellerName = name
            noOfTravellers = travellers
            classType = cabin
            
            
        }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            if let destination = segue.destination as? RamavathResultViewController {
                destination.travellerName = travellerName
                destination.noOfTravellers = noOfTravellers
                destination.classType = classType
            }
        }
    }
    
}

