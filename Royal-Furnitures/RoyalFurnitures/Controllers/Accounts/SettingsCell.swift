import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView?      // 👈 OPTIONAL
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hintImage: UIImageView!

    private var borderLayer: CAShapeLayer?
    private var didSetupShadow = false

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    // MARK: - Shadow (Elevation)

    private func setupShadowIfNeeded() {
        guard let shadowView = shadowView else { return }
        guard !didSetupShadow else { return }

        shadowView.backgroundColor = .systemBackground   // 🔑 card surface
        shadowView.layer.cornerRadius = 12
        shadowView.layer.masksToBounds = false

        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.18             // soft but visible
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 6)
        shadowView.layer.shadowRadius = 10                // blur = elevation

        didSetupShadow = true
    }


    // MARK: - Border

    func configureBorders(
        isFirstRow: Bool,
        isCenterRow: Bool,
        isLastRow: Bool
    ) {
        borderLayer?.removeFromSuperlayer()

        let lineWidth: CGFloat = 2
        let radius: CGFloat = 12

        let bounds = containerView.bounds.insetBy(
            dx: lineWidth / 2,
            dy: lineWidth / 2
        )

        let path = UIBezierPath()

        if isFirstRow {
            // Top + Left + Right
            path.move(to: CGPoint(x: bounds.minX + radius, y: bounds.minY))
            path.addLine(to: CGPoint(x: bounds.maxX - radius, y: bounds.minY))
            path.addArc(
                withCenter: CGPoint(x: bounds.maxX - radius, y: bounds.minY + radius),
                radius: radius,
                startAngle: -.pi / 2,
                endAngle: 0,
                clockwise: true
            )

            path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))

            path.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
            path.addLine(to: CGPoint(x: bounds.minX, y: bounds.minY + radius))
            path.addArc(
                withCenter: CGPoint(x: bounds.minX + radius, y: bounds.minY + radius),
                radius: radius,
                startAngle: .pi,
                endAngle: -.pi / 2,
                clockwise: true
            )
        }

        else if isCenterRow {
            // Left + Right only
            path.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
            path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))

            path.move(to: CGPoint(x: bounds.maxX, y: bounds.minY))
            path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        }

        else if isLastRow {
            // Left + Right + Bottom
            path.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
            path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY - radius))
            path.addArc(
                withCenter: CGPoint(x: bounds.minX + radius, y: bounds.maxY - radius),
                radius: radius,
                startAngle: .pi,
                endAngle: .pi / 2,
                clockwise: false
            )

            path.addLine(to: CGPoint(x: bounds.maxX - radius, y: bounds.maxY))
            path.addArc(
                withCenter: CGPoint(x: bounds.maxX - radius, y: bounds.maxY - radius),
                radius: radius,
                startAngle: .pi / 2,
                endAngle: 0,
                clockwise: false
            )

            path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        }

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = .round
        shapeLayer.lineCap = .round
        shapeLayer.frame = containerView.bounds

        containerView.layer.addSublayer(shapeLayer)
        borderLayer = shapeLayer
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupShadowIfNeeded()

        borderLayer?.frame = containerView.bounds

        // ✅ SAFE — only if outlet exists
        if let shadowView = shadowView {
            shadowView.layer.shadowPath = UIBezierPath(
                roundedRect: shadowView.bounds,
                cornerRadius: 12
            ).cgPath
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        borderLayer?.removeFromSuperlayer()
        borderLayer = nil
        didSetupShadow = false
    }
}

