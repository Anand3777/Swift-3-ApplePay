//
//  AppFonts.swift
//  TemployMe
//
//  Created by A2 MacBook Pro 2012 on 04/12/21.
//

import Foundation
import UIKit

private let familyName = "BwModelica"

enum AppFont: String {
    case light = "Light"
    case regular = "Regular"
    case bold = "Bold"
    case semiBold = "SemiBold"
    case medium = "Medium"

    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: fullFontName, size: size + 1.0) {
            return font
        }
        fatalError("Font '\(fullFontName)' does not exist.")
    }
    fileprivate var fullFontName: String {
        return rawValue.isEmpty ? familyName : familyName + "-" + rawValue
    }
}

