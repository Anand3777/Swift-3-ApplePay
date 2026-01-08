import UIKit

protocol SwipeButtonDelegate: AnyObject {
    func swipeButtonDidCompleteAction(_ swipeButton: SwipeButton)
}

class SwipeButton: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Swipe to Call 999"
        label.textAlignment = .center
        label.textColor = UIColor(hex: "FD4755")
        label.font = AppFont.bold.size(16)
        return label
    }()
    
    private let swipeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "FD4755")
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "arrow.right"))
        imageView.tintColor = .white
        imageView.contentMode = .center
        return imageView
    }()
    
    private var swipeViewLeadingConstraint: NSLayoutConstraint!
    private var isSwiped = false
    weak var delegate: SwipeButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addPanGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        addPanGesture()
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor(hex: "FD4755")?.cgColor
        
        // Add label
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        // Add swipe view
        addSubview(swipeView)
        swipeView.translatesAutoresizingMaskIntoConstraints = false
        swipeViewLeadingConstraint = swipeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        NSLayoutConstraint.activate([
            swipeViewLeadingConstraint,
            swipeView.centerYAnchor.constraint(equalTo: centerYAnchor),
            swipeView.widthAnchor.constraint(equalToConstant: 50),
            swipeView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Add arrow image view inside swipe view
        swipeView.addSubview(arrowImageView)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowImageView.centerXAnchor.constraint(equalTo: swipeView.centerXAnchor),
            arrowImageView.centerYAnchor.constraint(equalTo: swipeView.centerYAnchor)
        ])
    }
    
    private func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        swipeView.addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        
        switch gesture.state {
        case .changed:
            if translation.x > 0, translation.x + 50 < bounds.width {
                swipeViewLeadingConstraint.constant = translation.x
                updateBackgroundColor(with: translation.x)
            }
        case .ended:
            if translation.x + 50 >= bounds.width * 0.85 {
                completeSwipeAction()
            } else {
                resetSwipeView()
            }
        default:
            break
        }
    }
    
    private func completeSwipeAction() {
        isSwiped = true
        UIView.animate(withDuration: 0.3, animations: {
            self.swipeViewLeadingConstraint.constant = self.bounds.width - 45
            self.backgroundColor = UIColor(hex: "FD4755")
            self.layoutIfNeeded()
        }) { _ in
            self.delegate?.swipeButtonDidCompleteAction(self)
        }
    }
    
    private func resetSwipeView() {
        isSwiped = false
        UIView.animate(withDuration: 0.3) {
            self.swipeViewLeadingConstraint.constant = 0
            self.backgroundColor = .white
            self.layoutIfNeeded()
        }
    }
    
    private func updateBackgroundColor(with translationX: CGFloat) {
        // Calculate the progress of the swipe (0 to 1)
        let progress = min(1, translationX / (bounds.width - 45))
        
        // Interpolate the color from white to red
        backgroundColor = UIColor(
            red: 1.0,
            green: 1.0 - progress,
            blue: 1.0 - progress,
            alpha: 1.0
        )
    }
}
