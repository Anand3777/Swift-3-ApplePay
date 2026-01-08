//
//  BeljwarProvider.swift
//  TemployMe
//
//  Created by Kanna on 20/05/2024.
//

import UIKit
import SideMenu

enum OTPVerifyType{
    case register
    case moblile
    case email
    case forgotPassword
}

struct Coordinator {
    static func SelectLanguageScreen() {
        let VC = Storyboard.intro.instantiate(identifier: SelectLangVC.self)
        let navVC = UINavigationController.init(rootViewController: VC)
        UIApplication.shared.setRoot(vc: navVC)
    }
    
    static func IntroScreen() {
        let VC = Storyboard.intro.instantiate(identifier: IntroOneVC.self)
        let navVC = UINavigationController.init(rootViewController: VC)
        UIApplication.shared.setRoot(vc: navVC)
    }
    
    static func loginScreen(delegate: UIViewController?,type: String) {
        let VC = Storyboard.onboard.instantiate(identifier: LoginVC.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        VC.selectedLogin = type
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func SignUpScreen() {
        let VC = Storyboard.onboard.instantiate(identifier: SignUpVC.self)
        let navVC = UINavigationController.init(rootViewController: VC)
        UIApplication.shared.setRoot(vc: navVC)
    }
    
    static func otpRegisterVerifyScreen(delegate: UIViewController?,type: OTPVerifyType, email: String?, mobile: String?) {
        let VC = Storyboard.onboard.instantiate(identifier: OTPVC.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        VC.email = email ?? ""
        VC.mobileNo = mobile ?? ""
        VC.otpVerifyType = type
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func forgorPSWDScreen(delegate: UIViewController?) {
        let VC = Storyboard.onboard.instantiate(identifier: ForgotPswdVC.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func homeScreen() {
        let VC = Storyboard.home.instantiate(identifier: MainTabBarController.self)
        let navVC = UINavigationController.init(rootViewController: VC)
        UIApplication.shared.setRoot(vc: navVC)
    }
    

//    static func homeScreen(delegate: UIViewController?) {
//        let VC = Storyboard.home.instantiate(identifier: HomeVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func otpScreen(delegate: UIViewController?) {
//        let VC = Storyboard.intro.instantiate(identifier: OTPVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func addressListScreen(delegate: UIViewController?) {
//        let VC = Storyboard.home.instantiate(identifier: AddressVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func settingsScreen(delegate: UIViewController?) {
//        let VC = Storyboard.settings.instantiate(identifier: SettingsVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func setLocationScreen(delegate: UIViewController?) {
//        let VC = Storyboard.home.instantiate(identifier: SetLocationVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func chooseRideScreen(delegate: UIViewController?) {
//        let VC = Storyboard.home.instantiate(identifier: ChooseRideVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func requestRideScreen(delegate: UIViewController?) {
//        let VC = Storyboard.home.instantiate(identifier: RequestVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func cancelRideScreen(delegate: UIViewController?) {
//        let VC = Storyboard.home.instantiate(identifier: CancelRideVC.self)
//        VC.modalPresentationStyle = .overCurrentContext
//        delegate?.present(VC, animated: true)
//    }
//    
//    static func rideWatingScreen(delegate: UIViewController?) {
//        let VC = Storyboard.home.instantiate(identifier: RiderWaitingVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    
//    
//    static func emergencyScreen(delegate: UIViewController?) {
//        let VC = Storyboard.chat.instantiate(identifier: EmergencyVC.self)
//        VC.modalPresentationStyle = .overCurrentContext
//        delegate?.present(VC, animated: true)
//    }
//    
//    static func chatScreen(delegate: UIViewController?) {
//        let VC = Storyboard.chat.instantiate(identifier: ChatVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func helpScreen(delegate: UIViewController?) {
//        let VC = Storyboard.settings.instantiate(identifier: HelpVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func paymentListScreen(delegate: UIViewController?) {
//        let VC = Storyboard.settings.instantiate(identifier: PaymentListVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func supportScreen(delegate: UIViewController?) {
//        let VC = Storyboard.settings.instantiate(identifier: SupportListVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func supportDetailScreen(delegate: UIViewController?) {
//        let VC = Storyboard.settings.instantiate(identifier: SupportDetailVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func inviteScreen(delegate: UIViewController?) {
//        let VC = Storyboard.settings.instantiate(identifier: InviteVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func notificationScreen(delegate: UIViewController?) {
//        let VC = Storyboard.settings.instantiate(identifier: NotificationVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func promoCodeScreen(delegate: UIViewController?) {
//        let VC = Storyboard.settings.instantiate(identifier: PromoCodeVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func rideListScreen(delegate: UIViewController?) {
//        let VC = Storyboard.ride.instantiate(identifier: RideListVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func rideDetailScreen(delegate: UIViewController?) {
//        let VC = Storyboard.ride.instantiate(identifier: RideDetailVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    
//    static func signupScreen(delegate: UIViewController?) {
//        let VC = Storyboard.intro.instantiate(identifier: SignUpVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
        
//    static func LoginScreen() {
//        let VC = Storyboard.authentication.instantiate(identifier: LoginVC.self)
//        let navVC = UINavigationController.init(rootViewController: VC)
//        UIApplication.shared.setRoot(vc: navVC)
//    }
//    static func goToVerifyOTP(delegate: UIViewController?,dialcode:String? = nil, phone:String? = nil) {
//        let VC = Storyboard.authentication.instantiate(identifier: VerifyOTPVC.self)
//        VC.dialCode = dialcode ?? ""
//        VC.phone = phone ?? ""
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func goToReqDetails(delegate: UIViewController?) {
//        let VC = Storyboard.authentication.instantiate(identifier: RegDetailsVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func goToSetLocation(delegate: UIViewController?,locationType:String? = nil) {
//        let VC = Storyboard.ride.instantiate(identifier: SelectLocationVC.self)
//        VC.locationType = locationType ?? ""
//        VC.delegate = delegate as? any RecentLocationVCDelegate
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func goToRequestTrip(delegate: UIViewController?,pickSaved:saveLocation? = nil,dropSaved:saveLocation? = nil,selectedDate:String? = nil,selectedTime:String? = nil) {
//        let VC = Storyboard.ride.instantiate(identifier: RequestTripVC.self)
//        VC.pickSavedLocation = pickSaved
//        VC.dropSavedLocation = dropSaved
//        VC.selectedDate = selectedDate ?? ""
//        VC.selectedTime = selectedTime ?? ""
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func goToRequestOptions(delegate: UIViewController?) {
//        let VC = Storyboard.requestOptions.instantiate(identifier: RequestOptionsVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func goToSearchDriver(delegate: UIViewController?,bookingId:String? = nil) {
//        let VC = Storyboard.requestDetails.instantiate(identifier: SearchDriverVC.self)
//        VC.bookingId = bookingId ?? ""
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func goToSafetyKitScreen(delegate: UIViewController?,type:Int) {
//        let VC = Storyboard.requestDetails.instantiate(identifier: SafetyTypesDetails.self)
//        VC.selectedType = type
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func goToTripStatusView(delegate: UIViewController?,type:Int,bookingId:String? = nil) {
//        let VC = Storyboard.requestDetails.instantiate(identifier: TripStatusView.self)
//        VC.bookingId = bookingId ?? ""
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func gotoTabbar() {
//        let tabbarVC = TabbarController()
//        //        let menuVC =  Storyboard.sidemenu.instantiate(identifier: SidemenuViewController.self)
//        //        let menuNavVC = UINavigationController(rootViewController: menuVC)
//        //        let sideMenuVC = SideMenuController(contentViewController: tabbarVC,
//        //                                            menuViewController: menuNavVC)
//        UIApplication.shared.setRoot(vc: tabbarVC)
//    }
//    static func goToCMS(delegate: UIViewController?, pageType: PageType) {
//        let VC = Storyboard.cms.instantiate(identifier: CMSVC.self)
//        VC.pageType = pageType
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func goToTripMapVC(delegate: UIViewController?,selectedType:Int,bookingId:String? = nil) {
//        let VC = Storyboard.booking.instantiate(identifier: TripMapVC.self)
//        VC.selectedType = selectedType
//        VC.bookingId = bookingId ?? ""
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func goToWithdrawVC(delegate: UIViewController?) {
//        let VC = Storyboard.wallet.instantiate(identifier: WithdrawVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func goToChatVC(delegate: UIViewController?) {
//        let VC = Storyboard.booking.instantiate(identifier: ChatVC.self)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        delegate?.navigationController?.pushViewController(VC, animated: false)
//    }
//    static func updateRootVCToSplashScreen() {
//        let vc = Storyboard.splash.instantiate(identifier: SplashVC.self)
//        let navVC = UINavigationController.init(rootViewController: vc)
//        UIApplication.shared.setRoot(vc: navVC)
//    }
}



