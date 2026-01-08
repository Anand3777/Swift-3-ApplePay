//
//  HomeCategoryCollCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 11/11/25.
//

import UIKit
import SDWebImage

class HomeCategoryCollCell: UICollectionViewCell {

  
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configUI(data: Subcategory) {
        self.imgProduct.sd_setImage(with: URL(string: data.icon ?? ""), placeholderImage: UIImage(named: "placeHolderImage"))
        lblTitle.text = data.name
    }
}

