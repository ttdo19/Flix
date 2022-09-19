//
//  ViewController.swift
//  Flix
//
//  Created by Trang Do on 9/11/22.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var moviesArray: [Movie] = []
    
    var filteredMovies: [Movie]!
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        getAPIData()
        filteredMovies = moviesArray
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.sizeToFit()
        movieTableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
    }
    
    func getAPIData() {
        API.getMovies() { (movies) in
            guard let movies = movies else {
                return
            }
            self.moviesArray = movies
            self.filteredMovies = movies
            self.movieTableView.reloadData()
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        
        let movie = filteredMovies[indexPath.row]
        
        cell.m = movie
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = movieTableView.indexPath(for: cell) {
            let m = filteredMovies[indexPath.row]
            let detailViewController = segue.destination as! MovieDetailsViewController
            detailViewController.movie = m
            movieTableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if searchText.isEmpty {
                filteredMovies = moviesArray
            } else {
                filteredMovies = moviesArray.filter { movie in
                    return movie.name.contains(searchText)
                }
            }
            movieTableView.reloadData()
        }
    }
    

}

