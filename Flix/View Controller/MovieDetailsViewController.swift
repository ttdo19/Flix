//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Trang Do on 9/18/22.
//

import UIKit
import AlamofireImage
class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var vote_count: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var release_date: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = movie.name
        backdropImage.af.setImage(withURL: movie.backdropURL!)
        posterImage.af.setImage(withURL: movie.imageURL!)
        posterImage.layer.cornerRadius = 10
        posterImage.clipsToBounds = false

        posterImage.layer.shadowColor = UIColor.black.cgColor
        posterImage.layer.shadowOpacity = 1
        posterImage.layer.shadowRadius = 20
        
        
//        vote_count.text = String(movie.vote_count)
//        rating.text = String(movie.rating)
//        language.text = movie.language
        synopsis.text = movie.synopsis
        release_date.text = movie.release_date
        // Do any additional setup after loading the view.
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
