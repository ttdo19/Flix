//
//  MovieTableViewCell.swift
//  Flix
//
//  Created by Trang Do on 9/11/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var plot: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
