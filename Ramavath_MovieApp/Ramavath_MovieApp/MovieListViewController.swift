//
//  MovieListViewController.swift
//  Ramavath_MovieApp
//
//  Created by Mukund Sai Ramavath on 4/27/25.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var movieListTableView: UITableView!

    var selectedGenre: Movies?

        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = selectedGenre?.genre
            movieListTableView.delegate = self
            movieListTableView.dataSource = self
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return selectedGenre?.list_Array.count ?? 0
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
            cell.textLabel?.text = selectedGenre?.list_Array[indexPath.row].movieName
            return cell
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "movieInfoSegue" {
                if let destination = segue.destination as? MovieInfoViewController,
                   let indexPath = movieListTableView.indexPathForSelectedRow {
                    let selectedMovie = selectedGenre?.list_Array[indexPath.row]
                    destination.movie = selectedMovie
                }
            }
        }
    }

