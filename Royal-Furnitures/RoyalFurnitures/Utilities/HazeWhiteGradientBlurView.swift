import UIKit

class HazeWhiteGradientBlurView: UIView {
    
    // Property to set the intensity of the haze (0.0 to 1.0)
    var hazeIntensity: CGFloat = 0.04 { // Decreased to 0.04 for 4% transparency
        didSet {
            hazeLayer.backgroundColor = UIColor(white: 1.0, alpha: hazeIntensity).cgColor
        }
    }
    
    // Property to set the corner radius
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true // Clip sublayers to bounds
            hazeLayer.cornerRadius = cornerRadius
            gradientLayer.cornerRadius = cornerRadius
        }
    }
    
    private let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light) // Change blur style as needed
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    
    private let hazeLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor(white: 1.0, alpha: 0.04).cgColor // Set initial 4% transparency
        return layer
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.white.withAlphaComponent(0.6).cgColor,
            UIColor.white.withAlphaComponent(0.8).cgColor  // Adjusted end with 10% opacity for more transparency
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Start at top-left
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)   // End at bottom-right
        return gradientLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(blurEffectView)
        
        // Set constraints to fill the view
        NSLayoutConstraint.activate([
            blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Set up haze layer
        layer.addSublayer(hazeLayer)
        
        // Uncomment this line if you want to add the gradient layer back
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        blurEffectView.frame = bounds
        hazeLayer.frame = bounds
        gradientLayer.frame = bounds
    }
}

