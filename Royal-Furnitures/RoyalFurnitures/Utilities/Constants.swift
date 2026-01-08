//
//  Constants.swift
//  Pramo Pack
//
//  Created by Mac User on 21/08/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import Foundation
import UIKit

var mutiLoginMessage = "Your account is either suspended or currently being used in other device. Please login again to proceed further."
var deviceType = "iOS"
var languageBool = false
var STRIPE_TEST_KEY = "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"


class Constants {
    static let shared: Constants = Constants()
    var languageBool: Bool = false

  
    static let baseURL = "https://cabby.tech/wuouxbfyqp/public/api/v1/"
    //"https://dxbitprojects.com/caby/public/api/v1/"
    
    static let headers: [(String, String)] = [
        ("APP-USER", "lovebake"),
        ("APP-PWD" , "df014f04b7e13046a2d057c9f2ce3e2b")
    ]
}

enum Config {
    static let googleApiKey = "AIzaSyBjQCbGVJJAE_tUGqE7tHJr9XsHQPQ1d6U"
    //"AIzaSyDpeMGQV5I2tOkgkUL4TQhdyHIbn68pSF0"
    static let googleSignInClientID = "399666808492-1hdqvvrpcet2ljvah190168tvd452lkj.apps.googleusercontent.com"
}
struct AppConstants {
    let currencyName = "USD"
    let currencySymbol = "$"
}

struct Storyboards {
    static let Main =  "Main"
    static let Authentication =  "Authentication"
    static let Notification =  "Notification"
    static let Account = "Account"
    static let Vacancies = "Vacancies"
    static let Search = "Search"
    static let CMS = "CMS"
    static let SideMenu = "Sidemenu"
}



struct CmsKeys {
    static let ABOUT_US = "ABOUT_US"
    static let PRIVACY_POLICY = "PRIVACY_POLICY"
    static let TERMS_AND_CONDITION = "TERMS_AND_CONDITION"
    static let HELP_SUPPORT = "HELP_SUPPORT"
}

enum TargetType {
    case monthly
    case halfYearly
    case yearly
}
enum CommonAlertTitles {
    static let NoInternetMessage  = "Please check your internet connection"
}

// MARK: - Constants

enum Constants_scanner {
  static let circleViewAlpha: CGFloat = 0.7
  static let rectangleViewAlpha: CGFloat = 0.3
  static let shapeViewAlpha: CGFloat = 0.3
  static let rectangleViewCornerRadius: CGFloat = 10.0
  static let maxColorComponentValue: CGFloat = 255.0
  static let originalScale: CGFloat = 1.0
  static let bgraBytesPerPixel = 4
}
