//
//  TriangleView.swift
//  Winam
//
//  Created by Zain on 26/02/2022.
//

import Foundation
import UIKit

class TriangleView: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.close()

        UIColor.red.withAlphaComponent(0.5).setFill()
        path.fill()
    }

}
