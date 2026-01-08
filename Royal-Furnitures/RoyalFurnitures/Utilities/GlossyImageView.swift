import UIKit

class GlossyImageView: UIImageView {
    
    private let gradientLayer = CAGradientLayer()
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGlossyEffects()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGlossyEffects()
    }
    
    private func setupGlossyEffects() {
        addGlossyGradientOverlay()
        addBlurEffect()
    }
    
    private func addGlossyGradientOverlay() {
        gradientLayer.colors = [
            UIColor.white.withAlphaComponent(0.6).cgColor,
            UIColor.clear.cgColor,
            UIColor.white.withAlphaComponent(0.8).cgColor
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        layer.addSublayer(gradientLayer)
    }
    
    private func addBlurEffect() {
        blurEffectView.alpha = 0.2
        addSubview(blurEffectView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update frames to match the bounds of the image view
        gradientLayer.frame = bounds
        blurEffectView.frame = bounds
    }
}

