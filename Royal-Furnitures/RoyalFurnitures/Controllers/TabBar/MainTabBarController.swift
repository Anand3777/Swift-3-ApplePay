//
//  MainTabBarController.swift
//  RoyalFurnitures
//
//  Created by CIPL on 08/11/25.
//



import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

    // MARK: - UITabBarControllerDelegate
       func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           guard let index = viewControllers?.firstIndex(of: viewController) else { return }
           // Animate the tapped icon
           animateIconAt(index: index)
       }

       // Animate the icon at given tab index
       private func animateIconAt(index: Int) {
           // Get tab bar button UIControl views ordered left-to-right
           let tabBarButtonViews = tabBar.subviews
               .filter { $0 is UIControl }
               .sorted { $0.frame.minX < $1.frame.minX }

           guard index >= 0, index < tabBarButtonViews.count else { return }
           let tabBarButton = tabBarButtonViews[index]

           // Find the image view inside that button (this is the standard structure)
           let imageView = findImageView(in: tabBarButton)

           // Reset transforms for all tab bar image views (so only selected one looks bigger)
           tabBarButtonViews.forEach { btn in
               if let iv = findImageView(in: btn) {
                   iv.transform = .identity
               }
           }

           guard let iconView = imageView else { return }

           // Animate scale up and keep it scaled for a short "pop" (switch back to identity if you want permanent)
           UIView.animate(withDuration: 0.18,
                          delay: 0,
                          usingSpringWithDamping: 0.6,
                          initialSpringVelocity: 0.8,
                          options: [.curveEaseOut],
                          animations: {
               iconView.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
           }, completion: { _ in
               // If you want the icon to stay big until another tab is selected, do nothing here.
               // If you prefer a pop effect (grow then return), uncomment the block below:

               /*
               UIView.animate(withDuration: 0.12) {
                   iconView.transform = .identity
               }
               */
           })
       }

       // Recursively search for UIImageView inside a view hierarchy
       private func findImageView(in view: UIView) -> UIImageView? {
           if let iv = view as? UIImageView {
               return iv
           }
           for sub in view.subviews {
               if let found = findImageView(in: sub) {
                   return found
               }
           }
           return nil
       }
}
