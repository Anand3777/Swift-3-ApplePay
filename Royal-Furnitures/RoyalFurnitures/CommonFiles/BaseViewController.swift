//
//  BaseViewController.swift
//  Disraption
//
//  Created by Adnan Sohail on 01/04/2024.
//

import UIKit
import SideMenu
import AVKit
import AVFoundation
enum ViewControllerType {
    
    case profile
    case myProfile
    
    case discover
    case bookingDetails
    case inbox
    case checkout
    case aboutUs
    case filter
    case contactSupport
    case account
    case cart
    case gift
    case workshop
    case storeDetails
    case authentication
    case home
    case search
    case bookings
    case notifications
    case noBackButton
    case back
    case serviceInfo
    case serviceBooking
    case servicedetails
    case cleaningService
    case amountBreakDown
}

class BaseViewController: UIViewController {
    var player: AVPlayer!
       var playerLayer: AVPlayerLayer!
    var type: ViewControllerType = .home
    var titleLabel: UILabel?
    
    func close() {
        dismiss(animated: true)
    }
    
    var shouldHideNavigation: Bool = true {
        didSet{
            navigationController?.isNavigationBarHidden = shouldHideNavigation
        }
    }
    var viewControllerTitle: String? {
        didSet {
            titleLabel?.text = viewControllerTitle ?? ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        solidNavigationBar()
        
        print("Pushed viewcontroller " + String(describing: Swift.type(of: self)))
        
        switch type {
        case.serviceInfo:
            setupBack()
        case .discover:
            setDiscoverScreen()
        case .bookingDetails:
            setBookingDetailsScreen()
        case .inbox:
            setInboxScreen()
        case .cart:
                setCartScreen()
        case .gift:
            setGiftScreen()
        case .workshop:
            setWorkshopScreen()
        case .storeDetails:
            setStoreDetailsScreen()
        case .authentication: break
        case .home:
            setHomeScreen()
        case .search:
            setSearchScreen()
            break
        case .bookings:
                setBookingsScreen()
            break
        case .notifications:
            setNotificationsScreen()
            break
        case .profile:
                setProfileScreen()
            break
        case .account:
            setAccountScreen()
            break
        case .back:
            setupBack()
            break
        case .noBackButton:
            break
        case .checkout:
            setCheckOutScreen()
        case .aboutUs:
            setAboutUsScreen()
        case .filter:
            setFilterScreen()
        case .myProfile:
            setMyProfileScreen()
        case .serviceBooking:
            setServices()
        case .servicedetails:
            setServicesDetails()
        case .cleaningService:
            setCleaningServiceScreen()
        case .amountBreakDown:
            setAmountBreakDownScreen()
        case .contactSupport:
            setMyProfileScreen()
        }
    }
    
    func hideNavigation(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.isNavigationBarHidden = true
    }
    func ShowNavigation(){
        navigationController?.navigationBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
    }

    private func solidNavigationBar() {
        navigationController?.navigationBar.isTranslucent = true
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        } else {
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.backgroundColor = .clear
        }
    }
    func setMyProfileScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
        addTitleAndBackButton()
    }
    func setCleaningServiceScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
        addTitleAndBackButton()
        //addinfo()
    }
    func setHomeScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
        setNavigationTitleImage()
        addSideMenu()
    }
    func setupBack() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addTitleLabel()
        addBackButton()
        
    }
    func setServices() {
        navigationItem.leftBarButtonItems = []
        addBackButton()
        addLeftTitleLabel()
        navigationItem.rightBarButtonItems = []
        self.setupNavigationBarVideo(videoUrl:"")
        //self.addinfo()
        //self.addVideoRight()
    }
    func setServicesDetails() {
        navigationItem.leftBarButtonItems = []
        addBackButton()
        addLeftTitleLabel()
        navigationItem.rightBarButtonItems = []
        
       // self.addinfo()
    }
    
    func addTitleAndBackButton() {
        // Create the custom back button
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "arrow-left"), for: .normal) // Set your custom back button image
//        backButton.setTitle(viewControllerTitle ?? "", for: .normal) // Optional: Add a title
//        backButton.titleLabel?.font = UIFont.init(name: "Poppins-Medium", size: 18) // Set your custom font and size
//        backButton.setTitleColor(UIColor(hex: "#1E1E1E"), for: .normal) // Set your custom text color
        backButton.tintColor = UIColor(hex: "#FF9100")
        backButton.addTarget(self, action: #selector(handleBackButtonPress), for: .touchUpInside)
        
        // Create the title label
        let titleLabel = UILabel()
        titleLabel.text = viewControllerTitle ?? ""
        titleLabel.font = UIFont.init(name: "Montserrat-Bold", size: 18)
        titleLabel.textColor = UIColor(hex: "#1B1B1B")
        
        // Create a stack view to contain both the back button and the title label
        let stackView = UIStackView(arrangedSubviews: [backButton, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8 // Adjust spacing as needed
        
        // Set the stack view as the custom view for the left bar button item
        let leftBarButtonItem = UIBarButtonItem(customView: stackView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc func handleBackButtonPress() {
        // Handle the back button press
        navigationController?.popViewController(animated: true)
    }
    
    func addBackButton() {
        let backButton = UIButton()
        backButton.setImage(#imageLiteral(resourceName: "Vector"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 27).isActive = true
        navigationItem.leftBarButtonItems?.append(UIBarButtonItem(customView: backButton))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    @objc func backButtonAction() {
        
        if let _ = navigationController?.popViewController(animated: true) {
            
        } else {
            navigationController?.tabBarController?.selectedIndex = 0
            dismiss(animated: true, completion: nil)
            
        }
    }
    
    func setInboxScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
        addLeftTitleLabel()
    }
    
    func setBookingsScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addSideMenu()
        addTitleLabel()
        addNotificationRight()
    }
    
    func setDiscoverScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addTitleAndBackButton()
        addFilterRight()
    }
    
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setBookingDetailsScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addTitleAndBackButton()
        addInfoRight()
    }
    
    func setNotificationsScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
        addTitleAndBackButton()
        addClear()
    }
    func setFilterScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
        addTitleAndBackButton()
        addFliterClear()
    }
    
    func setCheckOutScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addTitleAndBackButton()
    }
    
    func setAmountBreakDownScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addTitleAndBackButton()
    }
    
    func setAboutUsScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addTitleAndBackButton()
    }
    
    
    func setSearchScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
        setNavigationTitleImage()
    }
    
    
    
    
    
    func setProfileScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
        addLeftTitleLabel()
        addNotificationRight()
    }
    
    func setAccountScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addLeftTitleLabel()
        addLogout()
    }
    
    func setGiftScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addLeftTitleLabel()
    }
    
    func setCartScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addLeftTitleLabel()
        addNotificationRight()
    }
    
    func setWorkshopScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
        addLeftTitleLabel()
//        addSearchRight()
    }
    
    func setStoreDetailsScreen() {
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItems = []
//        setNavigationTitleImage()
//        addLeftTitleLabel()
        addBackButton()
        addTitleLabel()
//        addSearchRight()
    }
    
    func addTitleLabel() {
        
        if let customFont = UIFont(name: "Montserrat-Bold", size: 18) {
            titleLabel = UILabel()
            if let titleLabel = titleLabel {
                titleLabel.text = viewControllerTitle ?? ""
                titleLabel.font = AppFont.medium.size(16)
                titleLabel.textColor = UIColor(hex: "#1B1B1B")
    //            let stack = UIStackView(arrangedSubviews: [titleLabel])
    //            let barButton = UIBarButtonItem(customView: stack)
                navigationItem.title = titleLabel.text ?? ""
                
            }
        } else {
            print("Failed to load the custom font.")
        }
        
    }

    
    func addLeftTitleLabel() {
        titleLabel = UILabel()
        if let titleLabel = titleLabel {
            titleLabel.text = viewControllerTitle ?? ""
            titleLabel.font = UIFont.init(name: "Montserrat-Bold", size: 18)
            titleLabel.textColor = UIColor(hex: "#1B1B1B")
//            let stack = UIStackView(arrangedSubviews: [titleLabel])
            let barButton = UIBarButtonItem(customView: titleLabel)
            navigationItem.leftBarButtonItems?.append(barButton)
            
        }
    }
    
   
    
    func addFilterRight() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80.0, height: 80.0))
        let image = #imageLiteral(resourceName: "filter")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(filterAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItems?.append(barButton)
    }
    @objc func filterAction() {
        
    }
    
    func addInfoRight() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80.0, height: 80.0))
        let image = #imageLiteral(resourceName: "info")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(infoAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItems?.append(barButton)
    }
    @objc func infoAction() {
      
    }
    
    func addVideoRight() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80.0, height: 80.0))
        let image = #imageLiteral(resourceName: "Frame 2")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(addvideoTab), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItems?.append(barButton)
    }
    
    func setupNavigationBarVideo(videoUrl: String) {
        // Create a UIView to host the video
        let videoView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        videoView.translatesAutoresizingMaskIntoConstraints = false
        videoView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        videoView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        videoView.layer.cornerRadius = 10 // Adjust as needed
        videoView.layer.masksToBounds = true

        // Add video playback
        playVideo(in: videoView, videoUrl: videoUrl)

        // Add the video view to a UIBarButtonItem
        let videoBarButton = UIBarButtonItem(customView: videoView)
        navigationItem.rightBarButtonItem = videoBarButton

//        // Add tap gesture for interaction to open big view
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(videoTapped(_:)))
        videoView.addGestureRecognizer(tapGesture)
    }


    func playVideo(in view: UIView, videoUrl: String) {
        guard let videoURL = URL(string: videoUrl) else { return }

        // Initialize AVPlayer
        player = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        guard let playerLayer = playerLayer else { return }

        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        DispatchQueue.main.async { [weak self] in
            // Add the player layer to the view
            view.layer.addSublayer(playerLayer)

            // Start playing the video
            self?.player?.play()
        }
   

        // Ensure the player layer resizes dynamically
        view.layoutSubviews()
        view.setNeedsLayout()
    }

 

    @objc func videoTapped(_ sender: UITapGestureRecognizer) {

    }

    @objc func dismissFullscreenVideo(_ sender: UIButton) {
        guard let fullScreenVideoView = sender.superview else { return }

        // Remove the fullscreen video view
        fullScreenVideoView.removeFromSuperview()

        // Show the original small video view again
        if let smallVideoView = view.subviews.first(where: { $0.isHidden }) {
            smallVideoView.isHidden = false
        }
    }




    func addinfo() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80.0, height: 80.0))
        let image = #imageLiteral(resourceName: "info")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(addinfoTab), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItems?.append(barButton)
    }
    @objc func addinfoTab() {
      
    }
    
    @objc func addvideoTab() {
      
    }
    
    func addNotificationRight() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80.0, height: 80.0))
        let image = #imageLiteral(resourceName: "bell-black")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(notificationMethod), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItems?.append(barButton)
    }
    @objc func notificationMethod() {
     //   Coordinator.goToNotificationsVC(delegate: self)
    }
    func addClear() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 85.0, height: 80.0))
        button.addTarget(self, action: #selector(clearnotification), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 85).isActive = true
        button.heightAnchor.constraint(equalToConstant: 10).isActive = true
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        button.setTitle("Clear All", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "DMSans-Medium", size: 15)//AppFont.regular.size(12)
        button.setTitleColor(UIColor(hex: "#1B1B1B"), for: .normal)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItems?.append(barButton)
    }
    @objc func clearnotification() {
        
    }
    
    func addFliterClear() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80.0, height: 80.0))
        button.addTarget(self, action: #selector(clearFilter), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Poppins-Medium", size: 15)//AppFont.regular.size(12)
        button.setTitleColor(UIColor(hex: "#BAA360"), for: .normal)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItems?.append(barButton)
    }
    @objc func clearFilter() {
        
    }
    
    func addLogout() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80.0, height: 80.0))
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        button.setTitle("LOGOUT", for: .normal)
        button.titleLabel?.font = AppFont.regular.size(12)
        button.setTitleColor(UIColor(hex: "000000"), for: .normal)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItems?.append(barButton)
    }
    @objc func logout() {
        SessionManager.clearLoginSession()
//        Coordinator.presentLogin()
    }
    
    private func setNavigationTitleImage() {
        let logo = UIImage(named: "navigation_logo")
        let imageView = UIImageView(image: logo)
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: 130, height: 32)
        imageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView  = imageView
    }

    private func addSideMenu() {
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 24, height: 24)
        menuBtn.setImage(UIImage(named:""), for: .normal)
        menuBtn.addTarget(self, action: #selector(openSideMenu(_:)), for: .touchUpInside)

        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 22)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 17)
        currHeight?.isActive = true
        self.navigationItem.leftBarButtonItem = menuBarItem
    }
    
    @objc func openSideMenu(_ button : UIButton) {
        sideMenuController?.revealMenu()
    }
}


struct Logger {
    #if DEBUG
    static let minimumLogLevel: LogLevel = .debug
    #else
    static let minimumLogLevel: LogLevel = .none
    #endif
    static func log(
        logLevel: LogLevel,
        _ message: @autoclosure () -> String,
        file: String = #file,
        line: Int = #line,
        function: StaticString = #function) {
        if logLevel >= minimumLogLevel {
            let fileName = (file as NSString).lastPathComponent
            debugPrint("\(logLevel.emoji) – \(fileName):\(line) – \(function) – \(message())")
        }
    }
}

enum LogLevel: Int {
    
    case verbose = 1
    case debug = 2
    case info = 3
    case warning = 4
    case error = 5
    case none = 6
    
    var emoji: String {
        switch self {
        case .verbose: return "😱"
        case .debug:   return "😱"
        case .info:    return "😱"
        case .warning: return "😱"
        case .error:   return "😱"
        case .none:    return "😱"
        }
    }
}

extension LogLevel: Comparable {
    static func <(lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
