//
//  ExclusiveOffersCell.swift
//  RoyalFurnitures
//
//  Created by Anand on 09/01/26.
//

import UIKit

class ExclusiveOffersCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        containerView.layer.cornerRadius = 3
        containerView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
