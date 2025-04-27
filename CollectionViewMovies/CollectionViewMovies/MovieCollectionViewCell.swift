//
//  MovieCollectionViewCell.swift
//  CollectionViewMovies
//
//  Created by Mukund Sai Ramavath on 4/10/25.
//

import UIKit

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func assignMovie(movie: Movie) {
        imageView.image = movie.image
    }
}
