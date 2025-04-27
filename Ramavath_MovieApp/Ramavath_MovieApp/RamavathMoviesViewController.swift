//
//  RamavathMoviesViewController.swift
//  Ramavath_MovieApp
//
//  Created by Mukund Sai Ramavath on 4/26/25.
//

import UIKit

class RamavathMoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    var genres: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Genres"
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        genres = [
            Movies(genre: "Action", list_Array: [
                MovieList(movieName: "RRR", movieImage: "RRR", movieInfo: "Set in the 1920s, two revolutionaries fight against British colonialists. A visual spectacle with intense action and powerful performances."),
                MovieList(movieName: "Baahubali: The Beginning", movieImage: "Baahubali", movieInfo: "A prince embarks on a journey to avenge his father's death. Epic battles, royal intrigue, and breathtaking visuals."),
                MovieList(movieName: "Ala Vaikunthapurramuloo", movieImage: "Ala", movieInfo: "A man discovers he was switched at birth and embarks on a mission to set things right. Comedy, drama, and action blend perfectly."),
                MovieList(movieName: "Salaar", movieImage: "Salaar", movieInfo: "An intense action thriller where a ruthless man, caught in a world of crime, seeks revenge while navigating betrayal and power struggles"),
                MovieList(movieName: "Sye", movieImage: "Sye", movieInfo: "A college rugby team fights for pride and glory. Action, rivalry, and sportsmanship in a fast-paced story.")
            ]),
            Movies(genre: "Love Story", list_Array: [
                MovieList(movieName: "Geetha Govindam", movieImage: "Geetha Govindam", movieInfo: "A charming man falls in love with a woman after an awkward first meeting. Romance, comedy, and emotional moments define this love story."),
                MovieList(movieName: "Arjun Reddy", movieImage: "Arjun Reddy", movieInfo: "A brilliant but troubled surgeon’s emotional journey through love, heartbreak, and self-destruction."),
                MovieList(movieName: "Fidaa", movieImage: "Fidaa", movieInfo: "A young man falls in love with a spirited woman, but their cultural differences lead to a roller-coaster journey of love and conflict."),
                MovieList(movieName: "Darling", movieImage: "Darling", movieInfo: "A heartwarming romance about a man who falls for a woman he meets in an unexpected circumstance, navigating love, misunderstandings, and family."),
                MovieList(movieName: "Oohalu Gusagusalade", movieImage: "Oohalu", movieInfo: "A fresh romantic tale about love, misunderstandings, and finding true feelings between two complex characters.")
            ]),
            Movies(genre: "Comedy", list_Array: [
                MovieList(movieName: "Jathi Ratnalu", movieImage: "JathiRatnalu", movieInfo: "Three innocent friends find themselves in a series of comedic and absurd situations while trying to navigate the complexities of life."),
                MovieList(movieName: "F2: Fun and Frustration", movieImage: "F2", movieInfo: "Two married men struggle with the frustrations of married life. A hilarious comedy about love, relationships, and misunderstandings."),
                MovieList(movieName: "Khaleja", movieImage: "Khaleja", movieInfo: "A quirky story where a reluctant hero becomes the savior of a village. The mix of comedy, action, and spirituality makes this a fun ride."),
                MovieList(movieName: "Pelli Sandadi", movieImage: "PelliSandadi", movieInfo: "A delightful romantic comedy that revolves around a young man’s attempts to win over the girl of his dreams."),
                MovieList(movieName: "Adhurs", movieImage: "Adhurs", movieInfo: "A comic caper where two identical men—one an innocent and the other a mischievous one—find themselves in a series of hilarious adventures.")
            ]),
            Movies(genre: "Fantasy", list_Array: [
                MovieList(movieName: "Baahubali 2: The Conclusion", movieImage: "Baahubali2", movieInfo: "The epic conclusion to the Baahubali saga, filled with war, betrayal, and emotional drama. A perfect blend of fantasy and action."),
                MovieList(movieName: "Magadheera", movieImage: "Magadheera", movieInfo: "A warrior reincarnates to seek revenge. A magical fantasy with visual effects, gripping action, and a love story that transcends time."),
                MovieList(movieName: "Eega", movieImage: "Eega", movieInfo: "A man reincarnates as a fly to take revenge on the businessman who killed him. A wildly imaginative fantasy with humor and revenge."),
                MovieList(movieName: "Kalki 2898 AD", movieImage: "Kalki", movieInfo: " Indian mythology with futuristic storytelling, set in a dystopian future where a mercenary embarks on a mission to protect a child believed to be the prophesied Kalki, the tenth avatar of Vishnu ."),
                MovieList(movieName: "Arundhati", movieImage: "Arundhati", movieInfo: "A woman discovers the truth about her ancestor's battle against dark forces. Fantasy and revenge go hand in hand in this gripping tale.")
            ]),
            Movies(genre: "Horror", list_Array: [
                MovieList(movieName: "Raju Gari Gadhi", movieImage: "Raju", movieInfo: "A group of friends try to solve the mystery of a haunted resort. A mix of horror and comedy with eerie thrills."),
                MovieList(movieName: "Bhaagamathie", movieImage: "Bhaagamathie", movieInfo: " A supernatural thriller about an IAS officer who, while imprisoned in an abandoned mansion, uncovers a dark conspiracy while facing haunting paranormal forces."),
                MovieList(movieName: "Anukokunda Oka Roju", movieImage: "Anukokunda", movieInfo: "A woman has a terrifying experience with a mystery she cannot remember. Suspenseful, psychological horror with twists."),
                MovieList(movieName: "Chandramukhi", movieImage: "Chandramukhi", movieInfo: "A haunted mansion and a mysterious woman lead to spine-chilling experiences. A perfect blend of comedy and horror."),
                MovieList(movieName: "13B", movieImage: "13 B", movieInfo: "A man’s life takes a turn when his family moves into a new apartment. Strange occurrences and eerie events follow, leading to a terrifying discovery.")
            ])
        ]
        
        genres.sort { $0.genre < $1.genre }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath)
        cell.textLabel?.text = genres[indexPath.row].genre
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listsSegue" {
            if let destination = segue.destination as? MovieListViewController,
               let indexPath = moviesTableView.indexPathForSelectedRow {
                let selectedGenre = genres[indexPath.row]
                destination.selectedGenre = selectedGenre
            }
        }
    }

}
