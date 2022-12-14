//
//  API.swift
//  Flix
//
//  Created by Trang Do on 9/11/22.
//

import Foundation

struct API {
    
    static func getMovies(completion: @escaping ([Movie]?) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let dictionaries = dataDictionary["results"] as! [[String: Any]]
                
                var movies: [Movie] = []
                
                for dictionary in dictionaries {
                    let movie = Movie.init(dict: dictionary)
                    movies.append(movie)
                }
                
                return completion(movies)
            }
        }
        task.resume()
    }
    
    static func getSuperhero(completion: @escaping ([Movie]?) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/464052/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let dictionaries = dataDictionary["results"] as! [[String: Any]]
                
                var movies: [Movie] = []
                
                for dictionary in dictionaries {
                    let movie = Movie.init(dict: dictionary)
                    movies.append(movie)
                }
                
                return completion(movies)
            }
        }
        task.resume()
    }
    
    static func getTrailerKey(movieID: Int, completion: @escaping ([String]?) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let dictionaries = dataDictionary["results"] as! [[String: Any]]
                
                var trailerKey: [String] = []
                
                for dictionary in dictionaries {
                    let type = dictionary["type"] as! String
                    if (type == "Trailer") {
                        trailerKey.append(dictionary["key"] as! String)
                    }
                }
                return completion(trailerKey)
            }
        }
        task.resume()
    }
}
