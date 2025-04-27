//
//  ViewController.swift
//  CourseDisplayApp
//
//  Created by Mukund Sai Ramavath on 2/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewOL: UIImageView!
    
    @IBOutlet weak var crsNumOL: UILabel!
    
    @IBOutlet weak var crsTitleOL: UILabel!
    
    @IBOutlet weak var senOfferedOL: UILabel!
    
    @IBOutlet weak var prevBtnOL: UIButton!
    
    @IBOutlet weak var nextBtnOL: UIButton!
    
    var imageIndex = 0
    
    let courses = [["img01","44555","Network Security","Spring 2023"],
    ["img02","44643","Data Structures","Summer 2023"],
    ["img03","44222","Java","Spring 2025"]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Update the course details (image,crsNum,title,semOffered) with the 1st element of the array
        updateCourseDetails(imageNumber: imageIndex)
        //Previous btn disabled
        prevBtnOL.isEnabled = false
        // Next button enabled
        nextBtnOL.isEnabled = true
    }

    @IBAction func prevBtnClicked(_ sender: UIButton) {
        //decrement the image index
        
        imageIndex -= 1
        
        //update the course details
        updateCourseDetails(imageNumber: imageIndex)
        
        
        // next button should be enabled
        nextBtnOL.isEnabled = true
        
        //if the imageIndex = 0 prev button should be disabled
        
        if imageIndex == 0 {
            prevBtnOL.isEnabled = false
        }
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        
        //increment the image
        
        imageIndex += 1
        
        // Update the course details
        updateCourseDetails(imageNumber: imageIndex)
        
        
        //previous button should be enabled
        prevBtnOL.isEnabled = true
        
        //check if the element is at the end of the array , next button should be disabled
        
        if imageIndex == (courses.count - 1) {
            nextBtnOL.isEnabled = false
        }
        
    }
    
    func updateCourseDetails( imageNumber : Int) {
        
        imageViewOL.image = UIImage(named:courses[imageNumber][0])
        crsNumOL.text = courses[imageNumber][1]
        crsTitleOL.text = courses[imageNumber][2]
        senOfferedOL.text = courses[imageNumber][3]
    }
}

