//
//  AccountHeaderCell.swift
//  RoyalFurnitures
//
//  Created by Anand on 09/01/26.
//

import UIKit

class AccountHeaderCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!

    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        containerView.layer.cornerRadius = 14
        containerView.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner,
        ]
        containerView.layer.masksToBounds = true
    }

    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }

}
