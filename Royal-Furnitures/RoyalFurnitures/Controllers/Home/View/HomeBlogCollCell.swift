//
//  HomeBlogCollCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 25/11/25.
//

import UIKit
import SDWebImage

class HomeBlogCollCell: UICollectionViewCell {

    @IBOutlet weak var imgBlog: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDisc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configUI(data: LatestBlog) {
        self.imgBlog.sd_setImage(with: URL(string: data.thumbnail ?? ""), placeholderImage: UIImage(named: "placeHolderImage"))
        lblTitle.text = data.title
        lblDisc.text = data.shortDescription
    }
}

