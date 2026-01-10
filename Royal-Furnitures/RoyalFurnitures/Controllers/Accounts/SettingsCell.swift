import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView?      // 👈 OPTIONAL

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        setupFlutterCardShadow()
    }

    private func setupFlutterCardShadow() {
        guard let shadowView = shadowView else { return }
        
        shadowView.layer.masksToBounds = false
        shadowView.layer.cornerRadius = 20  // 👈 Changed from 12
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.layer.shadowOpacity = 0.25
        shadowView.layer.shadowRadius = 4
        
        shadowView.layer.shadowPath = UIBezierPath(
            roundedRect: shadowView.bounds,
            cornerRadius: 20  // 👈 Match cornerRadius
        ).cgPath
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView?.layer.shadowPath = UIBezierPath(
            roundedRect: shadowView?.bounds ?? .zero,
            cornerRadius: 20  // 👈 Updated to match
        ).cgPath
    }
}

