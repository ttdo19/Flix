//
//  Movie.swift
//  Flix
//
//  Created by Trang Do on 9/18/22.
//

import Foundation

class Movie {
    
    var name: String
    var synopsis: String
    var release_date: String
    var language: String
    var vote_count: Int
    var rating: Double
    var popularity: Any
    var imageURL: URL?
    var backdropURL: URL?
    
    
    init(dict: [String: Any]) {
        name = dict["title"] as! String
        synopsis = dict ["overview"] as! String
        release_date = dict["release_date"] as! String
        language = dict["original_language"] as! String
        vote_count = dict["vote_count"] as! Int
        rating = dict["vote_average"] as! Double
        popularity = dict["popularity"]!
        if let imageUrlString = dict["poster_path"] as? String {
            imageURL = URL(string: "https://image.tmdb.org/t/p/w185" + imageUrlString)
        }
        if let backdropURLString = dict["backdrop_path"] as? String {
            backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropURLString)
        }
    }
    
    
    
}
