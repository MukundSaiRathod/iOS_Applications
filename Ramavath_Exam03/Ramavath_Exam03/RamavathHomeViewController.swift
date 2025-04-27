//
//  RamavathHomeViewController.swift
//  Ramavath_Exam03
//
//  Created by Mukund Sai Ramavath on 4/22/25.
//

import UIKit

class RamavathHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var RamavathTVOL: UITableView!
    var sortedGames: [Game] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Games"
        RamavathTVOL.delegate = self
        RamavathTVOL.dataSource = self
        // Sort games alphabetically by name (handling nil values)
                sortedGames = games.sorted { ($0.name ?? "") < ($1.name ?? "") }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return sortedGames.count
       }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return games.count
//        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RamavathCell", for: indexPath)
                    cell.textLabel?.text = sortedGames[indexPath.row].name
                    return cell
        }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "cheekatiDescriptionSegue", sender: indexPath.row)
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
               if transition == "RamavathDescriptionSegue" {
                   let destination = segue.destination as! RamavathGameController
                   if let index = RamavathTVOL.indexPathForSelectedRow?.row {
                       destination.game = sortedGames[index]
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
