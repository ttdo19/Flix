//
//  ViewController.swift
//  Flix
//
//  Created by Trang Do on 9/11/22.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var movieTableView: UITableView!
    
    var moviesArray: [[String: Any?]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTableView.delegate = self
        movieTableView.dataSource = self
        getAPIData()
        movieTableView.rowHeight = 150
    }
    
    func getAPIData() {
        API.getMovies() { (movies) in
            guard let movies = movies else {
                return
            }
            print(movies)
            self.moviesArray = movies
            self.movieTableView.reloadData()
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        
        let movie = moviesArray[indexPath.row]
        
        cell.title.text = movie["title"] as? String ?? ""
        
        cell.plot.text = movie["overview"] as? String ?? ""
        
        if let imageUrlString = movie["poster_path"] as? String {
            let baseUrl = "https://image.tmdb.org/t/p/w185"
            let imageUrl = URL(string: baseUrl + imageUrlString)
            cell.movieImage.af.setImage(withURL: imageUrl!)
        }
        return cell
    }
}

