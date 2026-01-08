//
//  IntroOneVC.swift
//  RoyalFurnitures
//
//  Created by Kanna on 04/11/25.
//

import UIKit

class IntroOneVC: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView?
    
    @IBOutlet weak var btnSkep: UIButton?
    @IBOutlet weak var btnNext: UIButton?
    @IBOutlet weak var btnStarted: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView?.delegate = self
        config(page: 0)
        // Do any additional setup after loading the view.
    }
    
    func config(page: Int) {
        if page == 4{
            btnSkep?.isHidden = true
            btnNext?.isHidden = true
            btnStarted?.isHidden = false
        }else {
            btnSkep?.isHidden = false
            btnNext?.isHidden = false
            btnStarted?.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.scrollView?.layoutIfNeeded()
        }
    }
    
    @IBAction func skipAction(_sender: UIButton) {
        SessionManager.setSkipIn(isSkip: true)
        Coordinator.SignUpScreen()
    }
    
    @IBAction func nextScreen(_sender: UIButton) {
        guard let scrollView = scrollView else { return }
        let currentPage = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
        
        let nextPage = currentPage + 1
        guard nextPage < 5 else {
            return
        }
        config(page: nextPage)
        let offsetX = scrollView.frame.width * CGFloat(nextPage)
        let offset = CGPoint(x: offsetX, y: 0)
        
        // Animate to next page
        scrollView.setContentOffset(offset, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        print("page \(page)")
        config(page: page)
        
    }
}

