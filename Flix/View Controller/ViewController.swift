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
    
    var moviesArray: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTableView.delegate = self
        movieTableView.dataSource = self
        getAPIData()
//        movieTableView.rowHeight = 175
    }
    
    func getAPIData() {
        API.getMovies() { (movies) in
            guard let movies = movies else {
                return
            }
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
        
        cell.m = movie
        
        return cell
    }
}

