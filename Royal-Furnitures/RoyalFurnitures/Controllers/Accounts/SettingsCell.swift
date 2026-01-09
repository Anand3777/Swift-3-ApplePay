//
//  SettingsCell.swift
//  RoyalFurnitures
//
//  Created by Anand on 09/01/26.
//

import UIKit

class SettingsCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    private var borderContainer: UIView!
    private var isFirstRow = false
    private var isLastRow = false
    private var isCenterRow = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBorderContainer()
        selectionStyle = .none
    }
    
    private func setupBorderContainer() {
        // Create border container ABOVE content
        borderContainer = UIView()
        borderContainer.backgroundColor = .clear
        containerView.insertSubview(borderContainer, at: 0) // Behind content
        borderContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            borderContainer.topAnchor.constraint(equalTo: containerView.topAnchor),
            borderContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            borderContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            borderContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        containerView.clipsToBounds = false
    }
    
    func configureBorders(isFirstRow: Bool, isLastRow: Bool, isCenterRow: Bool) {
        self.isFirstRow = isFirstRow
        self.isLastRow = isLastRow
        self.isCenterRow = isCenterRow
        
        // Clear previous borders
        borderContainer.layer.sublayers?.removeAll()
        
        let borderHeight: CGFloat = 2
        let borderWidth: CGFloat = 2
        let cornerRadius: CGFloat = 12
        
        // FIRST ROW: Top corners rounded
        if isFirstRow {
            borderContainer.layer.cornerRadius = cornerRadius
            borderContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            borderContainer.clipsToBounds = true
            
            // Left border
            let leftBorder = CAGradientLayer()
            leftBorder.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor]
            borderContainer.layer.addSublayer(leftBorder)
            
            // Top border
            let topBorder = CAGradientLayer()
            topBorder.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor]
            borderContainer.layer.addSublayer(topBorder)
            
            // Right border
            let rightBorder = CAGradientLayer()
            rightBorder.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor]
            borderContainer.layer.addSublayer(rightBorder)
        }
        // LAST ROW: Bottom corners rounded
        else if isLastRow {
            borderContainer.layer.cornerRadius = cornerRadius
            borderContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            borderContainer.clipsToBounds = true
            
            // Left border
            let leftBorder = CAGradientLayer()
            leftBorder.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor]
            borderContainer.layer.addSublayer(leftBorder)
            
            // Right border
            let rightBorder = CAGradientLayer()
            rightBorder.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor]
            borderContainer.layer.addSublayer(rightBorder)
            
            // Bottom border
            let bottomBorder = CAGradientLayer()
            bottomBorder.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor]
            borderContainer.layer.addSublayer(bottomBorder)
        }
        // CENTER ROW
        else if isCenterRow {
            borderContainer.layer.cornerRadius = 0
            borderContainer.clipsToBounds = false
            
            // Left border
            let leftBorder = CAGradientLayer()
            leftBorder.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor]
            borderContainer.layer.addSublayer(leftBorder)
            
            // Right border
            let rightBorder = CAGradientLayer()
            rightBorder.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor]
            borderContainer.layer.addSublayer(rightBorder)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Force layout
        borderContainer.layoutIfNeeded()
        
        let borderHeight: CGFloat = 2
        let borderWidth: CGFloat = 2
        let sublayers = borderContainer.layer.sublayers?.compactMap { $0 as? CAGradientLayer }
        let bounds = borderContainer.bounds
        
        sublayers?.enumerated().forEach { (index, layer) in
            if isFirstRow {
                switch index {
                case 0: // Left
                    layer.frame = CGRect(x: 0, y: 0, width: borderWidth, height: bounds.height)
                case 1: // Top
                    layer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: borderHeight)
                case 2: // Right
                    layer.frame = CGRect(x: bounds.width - borderWidth, y: 0, width: borderWidth, height: bounds.height)
                default: break
                }
            } else if isCenterRow {
                switch index {
                case 0: // Left
                    layer.frame = CGRect(x: 0, y: 0, width: borderWidth, height: bounds.height)
                case 1: // Right
                    layer.frame = CGRect(x: bounds.width - borderWidth, y: 0, width: borderWidth, height: bounds.height)
                default: break
                }
            } else if isLastRow {
                switch index {
                case 0: // Left
                    layer.frame = CGRect(x: 0, y: 0, width: borderWidth, height: bounds.height)
                case 1: // Right
                    layer.frame = CGRect(x: bounds.width - borderWidth, y: 0, width: borderWidth, height: bounds.height)
                case 2: // Bottom
                    layer.frame = CGRect(x: 0, y: bounds.height - borderHeight, width: bounds.width, height: borderHeight)
                default: break
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        borderContainer.layer.sublayers?.removeAll()
        borderContainer.layer.cornerRadius = 0
        borderContainer.clipsToBounds = false
        borderContainer.layer.maskedCorners = []
        isFirstRow = false
        isLastRow = false
        isCenterRow = false
    }
}

