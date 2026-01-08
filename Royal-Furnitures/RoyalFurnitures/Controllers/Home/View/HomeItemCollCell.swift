//
//  HomeItemCollCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 11/11/25.
//

import UIKit
import SDWebImage

class HomeItemCollCell: UICollectionViewCell {
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configUI(data: Items) {
        self.imgProduct.sd_setImage(with: URL(string: data.thumbnailImage ?? ""), placeholderImage: UIImage(named: "placeHolderImage"))
        lblName.text = data.name
        lblPrice.text = data.pricing?.offerPrice?.replacingOccurrences(of: ".00", with: "")
        lblDiscount.text = data.pricing?.basePrice?.replacingOccurrences(of: ".00", with: "")
    }
}


