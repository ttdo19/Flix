//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Trang Do on 9/20/22.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var moviesArray: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPIData()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func getAPIData() {
        API.getSuperhero() { (movies) in
            guard let movies = movies else {
                return
            }
            self.moviesArray = movies
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        let movie = moviesArray[indexPath.row]
        
        cell.m = movie
        return cell
    }
    

}
