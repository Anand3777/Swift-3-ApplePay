//
//  UIViewController.swift
//  Mobile Classifieds(PEMS)
//
//  Created by Muneeb on 22/06/2022.
//

import Foundation
import UIKit
import SideMenu
extension UIViewController {
    
    func add(_ child: UIViewController) {
        addChild(child)
        UIView.animate(withDuration: 0.5) { [self] in
            view.addSubview(child.view)
            child.didMove(toParent: self)
        }
    }
  
    func removeChild() {
        guard parent != nil else {
            return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
        print("children after removing\(self.children.count)")
    }
    
    var sideMenuController: SideMenuController? {
        return findSideMenuController(from: self)
    }

    fileprivate func findSideMenuController(from viewController: UIViewController) -> SideMenuController? {
        var sourceViewController: UIViewController? = viewController
        repeat {
            sourceViewController = sourceViewController?.parent
            if let sideMenuController = sourceViewController as? SideMenuController {
                return sideMenuController
            }
        } while (sourceViewController != nil)
        return nil
    }
}
extension UITextField {

   func setPadding(left: CGFloat? = nil, right: CGFloat? = nil){
       if let left = left {
          let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
          self.leftView = paddingView
          self.leftViewMode = .always
       }

       if let right = right {
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
           self.rightView = paddingView
           self.rightViewMode = .always
       }
   }

}
