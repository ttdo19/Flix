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
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        // Tp get 3 posters per row, the height of the poster = width * 1.5
        let width = (view.frame.self.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
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
