//
//  ResultViewController.swift
//  DiscountMVC
//
//  Created by Mukund Sai Ramavath on 3/20/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var EnteredAmountOL: UILabel!
    
    @IBOutlet weak var EnteredDisountOL: UILabel!
    
    
    @IBOutlet weak var PriceAfterDiscountOL: UILabel!
    
    
    
    var amount = " "
    var discount = " "
    var priceAfterDiscount = " "
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        EnteredAmountOL.text = "Entered amount: \(amount)"
        EnteredDisountOL.text = "Discount: \(discount)"
        PriceAfterDiscountOL.text = "Price After Discount: \(priceAfterDiscount)"
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
