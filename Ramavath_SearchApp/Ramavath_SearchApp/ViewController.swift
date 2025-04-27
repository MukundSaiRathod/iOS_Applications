//
//  ViewController.swift
//  Ramavath_SearchApp
//
//  Created by Mukund Sai Ramavath on 3/27/25.
//

import UIKit
import AudioUnit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var searchButtonAction: UIButton!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var ShowPrevImageBtn: UIButton!
    
    @IBOutlet weak var ResetBtn: UIButton!
    
    @IBOutlet weak var ShowNextImageBtn: UIButton!
    
    @IBOutlet weak var topicInfoText: UITextView!
    var currentTopicIndex = 0
        var currentImageIndex = 0

    let topicNames = ["Famous Landmarks", "Revolutionary Inventions", "Rare Birds", "Resplendent Ruins", "Radiant Festivals"]

    let allPics = [
        ["redFort", "sanchiStupa", "indiaGate"],     // Famous Landmarks
        ["radio", "railwayEngine", "robot"],          // Revolutionary Inventions
        ["roadrunner", "rainforestBird", "redCardinal"], // Rare Birds
        ["romanColosseum", "rosenborgCastle", "ruinsOfPompeii"], // Resplendent Ruins
        ["rioCarnival", "ramadanFestival", "diwali"] // Radiant Festivals
    ]

    let topicKeywords = [
        ["historical", "indian monuments", "fortification"],          // Famous Landmarks
        ["inventions", "technology", "innovation"], // Revolutionary Inventions
        ["birds", "wildlife", "species"],          // Rare Birds
        ["ruins", "historical ruins", "ancient"],   // Resplendent Ruins
        ["festivals", "celebrations", "cultural"]   // Radiant Festivals
    ]

    let topicDescriptions = [
        ["Red Fort: The Red Fort (Lal Qila) is a 17th-century fort complex that served as the main residence of the Mughal emperors for nearly 200 years. It’s a UNESCO World Heritage Site and is located in the heart of Old Delhi. The fort is famous for its massive red sandstone walls and impressive architectural design.",
         "Sanchi Stupa: Sanchi Stupa is one of the oldest stone structures in India, built by Emperor Ashoka in the 3rd century BCE. It is a significant Buddhist monument and a UNESCO World Heritage Site.",
         "India Gate: A war memorial built in honor of soldiers who died during World War I. The 42-meter-high arch is an enduring symbol of national pride and remembrance."],
        
        ["Radio: The first technology that allowed wireless communication over long distances, revolutionizing broadcasting and communication worldwide.",
         "Railway Engine: The locomotive that powered trains, a key invention that transformed transportation, making long-distance travel and the movement of goods faster and more efficient.",
         "Robot: A machine designed to carry out tasks autonomously or under human control. Robots have revolutionized industries ranging from manufacturing to healthcare."],
        
        ["Roadrunner: A fast-running bird native to North America, known for its distinctive appearance and swift movements. It is often found in deserts and arid regions.",
         "Rainforest Bird: Birds that inhabit the lush and diverse ecosystems of tropical rainforests, including species like toucans, parrots, and hummingbirds.",
         "Red Cardinal: A striking red bird commonly found in North America. Known for its vibrant color and musical calls, it is often associated with winter and Christmas."],
        
        ["Roman Colosseum: A grand amphitheater located in Rome, Italy. Known for its gladiatorial contests and public spectacles, it stands as a testament to Roman engineering and architecture.",
         "Rosenborg Castle: A Renaissance-style castle in Copenhagen, Denmark, home to the Danish crown jewels and royal artifacts.",
         "Ruins of Pompeii: An ancient Roman city that was buried under volcanic ash from Mount Vesuvius in 79 AD. It is one of the most famous archaeological sites in the world."],
        
        ["Rio Carnival: The largest carnival in the world, held annually in Rio de Janeiro, Brazil. Known for its vibrant parades, samba dancers, and extravagant costumes.",
         "Ramadan Festival: A religious holiday observed by Muslims worldwide, celebrating the month of fasting and culminating in the festival of Eid. It is a time for spiritual reflection, fasting, and community.",
         "Diwali: The Festival of Lights, celebrated by Hindus, Sikhs, and Jains. It marks the victory of light over darkness and good over evil, with homes decorated in candles and fireworks."],
    ]



        override func viewDidLoad() {
            super.viewDidLoad()
            initializeView()
            searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }

        func initializeView() {
            resultImage.image = UIImage(named: "welcome")
            topicInfoText.text = """
Welcome to the Search App!
  RAMAVATH MUKUND SAI
"""
            searchButtonAction.isEnabled = false
            ShowNextImageBtn.isEnabled = false
            ShowPrevImageBtn.isEnabled = false
        }
    @objc func textFieldDidChange(_ textField: UITextField) {
            searchButtonAction.isEnabled = !(textField.text?.isEmpty ?? true)
        }


    @IBAction func searchButtonAction(_ sender: Any) {
        guard let searchText = searchTextField.text?.lowercased(), !searchText.isEmpty else { return }

                if let matchedTopicIndex = topicKeywords.firstIndex(where: { $0.contains(searchText) }) {
                    currentTopicIndex = matchedTopicIndex
                    currentImageIndex = 0
                    showTopicImage()
                    AudioServicesPlaySystemSound(1113)
                } else {
                    resultImage.image = UIImage(named: "error")
                    topicInfoText.text = "No results found for \(searchText)"
                }
            }

            func showTopicImage() {
                if currentTopicIndex < allPics.count {
                    let images = allPics[currentTopicIndex]
                    if currentImageIndex < images.count {
                        resultImage.image = UIImage(named: images[currentImageIndex])
                        if currentTopicIndex < topicDescriptions.count {
                            let descriptions = topicDescriptions[currentTopicIndex]
                            if currentImageIndex < descriptions.count {
                                topicInfoText.text = descriptions[currentImageIndex]
                            }
                        }
                    }
                }
                refreshButtonsState()
            }
    
    @IBAction func ShowNextImageBtn(_ sender: Any) {
        if currentTopicIndex < allPics.count,
                   currentImageIndex < allPics[currentTopicIndex].count - 1 {
                    currentImageIndex += 1
                    showTopicImage()
                    AudioServicesPlaySystemSound(1105)
                }
            }
    @IBAction func ShowPrevImageBtn(_ sender: Any) {
        if currentImageIndex > 0 {
                    currentImageIndex -= 1
                    showTopicImage()
                    AudioServicesPlaySystemSound(1105)
                }
            }

    @IBAction func ResetBtn(_ sender: Any) {
        initializeView()
                searchTextField.text = ""
                currentTopicIndex = 0
                currentImageIndex = 0
                AudioServicesPlaySystemSound(1111)
            }

            func refreshButtonsState() {
                ShowPrevImageBtn.isEnabled = currentImageIndex > 0
                ShowNextImageBtn.isEnabled = currentTopicIndex < allPics.count &&
                                      currentImageIndex < allPics[currentTopicIndex].count - 1
            }
        }
