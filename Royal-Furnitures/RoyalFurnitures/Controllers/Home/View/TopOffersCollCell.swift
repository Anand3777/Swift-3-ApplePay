//
//  TopOffersCollCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 11/11/25.
//

import UIKit
import SDWebImage

class TopOffersCollCell: UICollectionViewCell {

    @IBOutlet weak var imgOffer: UIImageView!
    @IBOutlet weak var lblOfferTitle: UILabel!
    @IBOutlet weak var lblOffersDisc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblOfferTitle.text = ""
        lblOffersDisc.text = ""
    }

    func configUI(imageURL: String,title: String, disc: String) {
        self.imgOffer.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeHolderImage"))
        lblOfferTitle.text = title
        lblOffersDisc.text = disc
    }
    }
