import UIKit


class RadialGlossyView: UIView {

    private let backgroundView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Set up corner radius for the main view
        layer.cornerRadius = 15 // Adjust as needed
        layer.masksToBounds = true // Ensure child views are clipped to the corner radius
        
        // Set up the background view
        setupBackgroundView()

        // Add radial gradient and blur effect to the background view
        addRadialGlossyGradient(to: backgroundView)
        addBlurEffect(to: backgroundView)
    }
    
    private func setupBackgroundView() {
        // Add background view as a subview
        backgroundView.frame = bounds
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Apply corner radius to the background view
        backgroundView.layer.cornerRadius = layer.cornerRadius
        backgroundView.layer.masksToBounds = true // Clip content to the rounded corners
        
        addSubview(backgroundView)
        
        // Send the background view to the back so child views are not hidden
        sendSubviewToBack(backgroundView)
    }
    
    private func addRadialGlossyGradient(to view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.type = .radial
        
        // Define the gradient colors
        gradientLayer.colors = [
            UIColor(hex: "FDFDFD")?.withAlphaComponent(1.0).cgColor ?? UIColor.white, // Center color
            UIColor(hex: "E7E7E7")?.withAlphaComponent(1.0).cgColor ?? UIColor.white, // Center color
        ]
        
        // Define the gradient’s center and radius
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5) // Center
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)   // Expands outward
        
        // Apply a circular mask for radial effect
        let maskLayer = CAShapeLayer()
        let circlePath = UIBezierPath(ovalIn: view.bounds)
        maskLayer.path = circlePath.cgPath
        gradientLayer.mask = maskLayer
        
        // Add gradient layer as a sublayer of the background view
        view.layer.addSublayer(gradientLayer)
    }
    
    private func addBlurEffect(to view: UIView) {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Set blur intensity
        blurEffectView.alpha = 1.0
        
        // Add the blur effect as a subview of the background view
        view.addSubview(blurEffectView)
    }
}

