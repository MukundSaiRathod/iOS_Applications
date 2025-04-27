//
//  Movies.swift
//  Ramavath_MovieApp
//
//  Created by Mukund Sai Ramavath on 4/27/25.
//


import Foundation
struct Movies {
    let genre: String
    let list_Array: [MovieList]
}

struct MovieList {
    let movieName: String
    let movieImage: String
    let movieInfo: String
}
