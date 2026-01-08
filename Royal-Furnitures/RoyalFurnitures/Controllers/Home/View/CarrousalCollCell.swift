//
//  CarrousalCollCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 11/11/25.
//

import UIKit
import SDWebImage

class CarrousalCollCell: UICollectionViewCell {

    @IBOutlet weak var imgBanner: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configUI(imageURL: String) {
        self.imgBanner.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeHolderImage"))
    }
}
