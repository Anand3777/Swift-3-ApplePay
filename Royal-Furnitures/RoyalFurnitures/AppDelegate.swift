//
//  AppDelegate.swift
//  RoyalFurnitures
//
//  Created by Kanna on 25/10/25.
//

import UIKit
import IQKeyboardManagerSwift
import IQKeyboardToolbarManager
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardToolbarManager.shared.isEnabled = true
        UNUserNotificationCenter.current().delegate = self
        
        setRootController()
        return true
    }
    
    func setRootController() {
        if SessionManager.isSkip() {
            if SessionManager.isLoggedIn(){
                Coordinator.homeScreen()
            }else {
                Coordinator.SignUpScreen()
            }
        }else {
            Coordinator.SelectLanguageScreen()
        }
    }
}

