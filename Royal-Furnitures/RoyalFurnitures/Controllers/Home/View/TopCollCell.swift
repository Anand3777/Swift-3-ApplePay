//
//  TopCollCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 11/11/25.
//

import UIKit

class TopCollCell: UICollectionViewCell {

    @IBOutlet weak var lblCate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblCate.layer.cornerRadius = 25
        lblCate.clipsToBounds = true
        
    }
}
