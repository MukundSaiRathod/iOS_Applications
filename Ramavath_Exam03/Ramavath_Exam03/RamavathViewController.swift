//
//  RamavathViewController.swift
//  Ramavath_Exam03
//
//  Created by Mukund Sai Ramavath on 4/22/25.
//

import UIKit

class RamavathGameController: UIViewController {
    
    
    @IBOutlet weak var imageViewOL: UIImageView!
    
    @IBOutlet weak var nameOL: UILabel!
    
    @IBOutlet weak var descriptionOL: UILabel!
    var game : Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let selectedGame = game {
                            self.title = selectedGame.name
                            imageViewOL.image = selectedGame.imageName
                            nameOL.text = selectedGame.name
                            descriptionOL.text = selectedGame.information
                            
                            // Add animation
            imageViewOL.alpha = 0
            UIView.animate(withDuration: 1.5) {
                self.imageViewOL.alpha = 1
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

}
