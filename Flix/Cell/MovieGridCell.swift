//
//  MovieGridCell.swift
//  Flix
//
//  Created by Trang Do on 9/20/22.
//

import UIKit
import AlamofireImage

class MovieGridCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    
    var m: Movie! {
        didSet {
            posterImage.af.setImage(withURL: m.imageURL!)
        }
    }
    
}
