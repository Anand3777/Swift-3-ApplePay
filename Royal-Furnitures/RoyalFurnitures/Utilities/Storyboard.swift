//
//  Storyboard.swift
//  TemployMe
//
//  Created by A2 MacBook Pro 2012 on 04/12/21.
//

import UIKit

enum Storyboard: String {
    case onboard = "Onboarding"
    case home = "Home"
    case intro = "Intro"

    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func instantiate<T>(identifier: T.Type) -> T {
        let storyboard = UIStoryboard(name: rawValue, bundle: nil)
        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: String(describing: identifier)) as? T else {
            fatalError("No such view controller found")
        }
        return viewcontroller
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

// MARK: - StoryBoard Identifiable
extension UIViewController {
    static var storyboardID : String {
        return "\(self)" + "_ID"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: Storyboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
