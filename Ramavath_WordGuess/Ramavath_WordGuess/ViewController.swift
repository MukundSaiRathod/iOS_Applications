//
//  ViewController.swift
//  Ramavath_WordGuess
//
//  Created by Mukund Sai Ramavath on 3/5/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    
    
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    
    
    @IBOutlet weak var totalWordsLabel: UILabel!
    
    @IBOutlet weak var userGuessLabel: UILabel!
    
    
    @IBOutlet weak var guessLetterField: UITextField!
    
    
    
    @IBOutlet weak var hintLabel: UILabel!
    
    @IBOutlet weak var guessCountLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var GuessBtn: UIButton!
    
    @IBOutlet weak var PlayAgainBtn: UIButton!
    
    
    @IBOutlet weak var displayImage: UIImageView!
    
    let words = ["BHAVANI", "KUMBHMELA", "DELHI", "HYDERABAD", "HALEEM"]
    let hints = ["Goddess", "Biggest Gathering", "India's Capital", "Telangana City", "Ramazan food"]
    var curIndex = 0
    var currentGuess = ""
    var incorrectGuess = 0
    let maxGuess = 10
    var correctGuessesCount = 0
       
               

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //super.viewDidLoad()
        setupGame()
        guessLetterField.delegate = self
        guessLetterField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
            }
    func setupGame() {
        let currentWord = words[curIndex]
        currentGuess = String(repeating: "_ ", count: currentWord.count)
        userGuessLabel.text = currentGuess
        hintLabel.text = "HINT: \(hints[curIndex])"
        guessCountLabel.text = "You have Made Zero Guesses"
        statusLabel.text = "..."
        wordsGuessedLabel.text = "Total number of words guessed successfully: \(correctGuessesCount)"
        wordsRemainingLabel.text = "Total number of words remaining in game: \(words.count - correctGuessesCount)"
        totalWordsLabel.text = "Total number of words in game: \(words.count)"
        PlayAgainBtn.isHidden = true
        guessLetterField.text = ""
        GuessBtn.isEnabled = false
        incorrectGuess = 0
        displayImage.image = nil
    }
    
    @objc func textFieldEditingChanged() {
        if let text = guessLetterField.text, !text.isEmpty {
            guessLetterField.text = String(text.last!)
            GuessBtn.isEnabled = true
        } else {
            GuessBtn.isEnabled = false
        }
    }
    @IBAction func guessLetterButtonPressed(_ sender: Any) {
        guard let letter = guessLetterField.text?.uppercased(), letter.count == 1 else { return }
        let currentWord = words[curIndex]
        var newGuessedState = ""
        var correctGuess = false
        
        for (index, char) in currentWord.enumerated() {
            if String(char) == letter {
                newGuessedState += "\(char) "
                correctGuess = true
            } else {
                newGuessedState += "\(currentGuess.split(separator: " ")[index]) "
            }
        }
        
        currentGuess = newGuessedState
        userGuessLabel.text = currentGuess
        
        if correctGuess {
            statusLabel.text = "Good guess! Keep going."
        } else {
            incorrectGuess += 1
            statusLabel.text = "Wrong guess. Try again."
        }
        
        guessCountLabel.text = "You have Made \(incorrectGuess) Guesses"
        GuessBtn.isEnabled = false
        guessLetterField.text = ""
        
        if !currentGuess.contains("_") {
            statusLabel.text = "You've guessed it correctly! '\(currentWord.lowercased())' 🎉"
            displayImage.image = UIImage(named: currentWord.lowercased())
            PlayAgainBtn.isHidden = false
            correctGuessesCount += 1
            
            if incorrectGuess == maxGuess {
                guessCountLabel.text = "Wow! You made 10 guesses to guess the word."
            }
        } else if incorrectGuess == maxGuess {
            guessCountLabel.text = "You have used all available guesses, Please play again."
            PlayAgainBtn.isHidden = false
        }
        
        wordsGuessedLabel.text = "Total number of words guessed successfully: \(correctGuessesCount)"
        wordsRemainingLabel.text = "Total number of words remaining in game: \(words.count - correctGuessesCount)"
        totalWordsLabel.text = "Total number of words in game: \(words.count)"
        
        if correctGuessesCount == words.count {
            statusLabel.text = "Congratulations, You are done! Please start over again."
        }
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        if correctGuessesCount == words.count {
            statusLabel.text = "Let's start over!"
            correctGuessesCount = 0
            curIndex = 0
            setupGame()
        } else {
            if !currentGuess.contains("_") {
                curIndex += 1
            }
            setupGame()
        }
    }
       }

