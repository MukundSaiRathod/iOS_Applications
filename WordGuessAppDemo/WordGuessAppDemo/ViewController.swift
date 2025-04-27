//
//  ViewController.swift
//  WordGuessAppDemo
//
//  Created by Mukund Sai Ramavath on 2/13/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayOL: UILabel!
    
    @IBOutlet weak var hintOL: UILabel!
    
    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var checkOL: UIButton!
    
    @IBOutlet weak var messageOL: UILabel!
    
    @IBOutlet weak var playAgainOL: UIButton!
    
    // creating an Array of words and their Hints
    
    var words = [["Bhavani", "Goddess"],
                 ["Car","4 Wheeler"],["Apple","Fruit"]
                 ]
    var count = 0
    var word = ""
    var lettersGuessed = ""
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //At first check button shoul be disabled
        checkOL.isEnabled = false
        
        // get the first word from the above for guessing the word
        
        word = words[count][0]
        displayOL.text=""
        
        updateUnderScores()
        
        // update underscores as per number of letters in the word
        
        
        // getting Hints
        
        hintOL.text = words[count][1]
        
        //message displayed should be nothing intially
        
        messageOL.text=""
    }

    @IBAction func checkBtnClick(_ sender: UIButton) {
        
        var letter = inputOL.text!
        
        // replacing the letter if it is a part of the word
        lettersGuessed = lettersGuessed + letter
        
        var revealWord = ""
        
        for i in word{
            if lettersGuessed.contains(i){
                revealWord.append(i)
            }else{
                revealWord.append("_")
            }
        }
        
        // Displaying the word after guess
        displayOL.text = revealWord
        inputOL.text = ""
        
        // if the word guessed is correct then enabling play again button and disbling check button
        if displayOL.text!.contains("_") == false{
            playAgainOL.isHidden = false;
            checkOL.isEnabled = false;
                }
        checkOL.isEnabled = false
        
    }
    
    @IBAction func playAgainBtnClick(_ sender: UIButton) {
        
        //Reset the button to disable initially.
        playAgainOL.isHidden = true
               //clear the label
               lettersGuessed = ""
               count += 1
               //if count reaches the end of the array (all the words are guessed sucessfully), then print Congratualtions in the status label.
               if count == words.count{
                   
                   messageOL.text = "Congruations! You are done with the game!"
                   //clearing the labels.
                   displayOL.text = ""
                   hintOL.text = ""
               }
               else{
                   //fetch the next word from the array
                   word = words[count][0]
                   //fetch the hint related to the word
                   hintOL.text = "Hint: "
                   hintOL.text! += words[count][1]
                   //Enabling the check button.
                   checkOL.isEnabled = true
                   
                   displayOL.text = ""
                   //updateUnderscores();
                   var displayText = ""
                   for letter in word{
                       if lettersGuessed.contains(letter){
                           displayText.append(letter)
                       }else{
                           displayText.append("_")
                       }
                   }
                   displayOL.text = displayText
                   
               }
        
        
    }
    
    @IBAction func letterEntered(_ sender: UITextField) {
        
        //Read the data from the text field
        var textEnterd = messageOL.text!;
                //Consider only the last character by calling textEntered.last and trimming the white spaces.
                textEnterd = String(textEnterd.last ?? " ").trimmingCharacters(in: .whitespaces)
        messageOL.text = textEnterd
                
                //Check whether the entered text is empty or not to enable check button.
                if textEnterd.isEmpty{
                    checkOL.isEnabled = false
                }
                else{
                    checkOL.isEnabled = true
                }
    }
    
    func updateUnderScores(){
        var displayText = ""
        for letter in word{
            if lettersGuessed.contains(letter){
                displayText.append(letter)
            }else{
                displayText.append("_")
            }
        }
        displayOL.text = displayText
    }
    
}

