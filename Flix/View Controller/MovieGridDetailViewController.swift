//
//  MovieGridDetailViewController.swift
//  Flix
//
//  Created by Trang Do on 9/21/22.
//

import UIKit
import AlamofireImage

class MovieGridDetailViewController: UIViewController {

    var movie: Movie!
    
    var keysArray: [String]!
    
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var release_date: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var backdropView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPIData()
        
        name.text = movie.name
        synopsis.text = movie.synopsis
        release_date.text = movie.release_date
        posterView.af.setImage(withURL: movie.imageURL!)
        posterView.layer.cornerRadius = 10
        posterView.clipsToBounds = false
        
        posterView.layer.shadowColor = UIColor.black.cgColor
        posterView.layer.shadowOpacity = 1
        posterView.layer.shadowRadius = 20
        
        backdropView.af.setImage(withURL: movie.backdropURL!)
        // Do any additional setup after loading the view.
        posterView.isUserInteractionEnabled = true
    }
    
    func getAPIData() {
        API.getTrailerKey(movieID: movie.movieID) { (key) in
            guard let key = key else {
                return
            }
            self.keysArray = key
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tap = sender as! UITapGestureRecognizer
        let key = keysArray.first
        let detailViewController = segue.destination as! MovieTrailerViewController
        detailViewController.trailerKey = key
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
