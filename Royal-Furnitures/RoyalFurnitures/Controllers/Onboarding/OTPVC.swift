//
//  OTPVC.swift
//  RoyalFurnitures
//
//  Created by Kanna on 05/11/25.
//

import UIKit
import DPOTPView

class OTPVC: UIViewController {
    
    var otpVerifyType:OTPVerifyType?
    var email = ""
    var mobileNo = ""
    
    var timer: Timer?
    var remainingTime = 30
    
    
    @IBOutlet weak var otpView: DPOTPView!
    @IBOutlet weak var btnResend: UIButton!
    @IBOutlet weak var lblTimer: UILabel!
    
    @IBOutlet weak var lblOTPTypeTitle: UILabel!
    @IBOutlet weak var lblOTPType: UILabel!
    
    var viewModel: OTPViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUI()
        otpView.dpOTPViewDelegate = self
        viewModel = OTPViewModel(output: self)
        startOTPTimer()
    }
    
    func configUI() {
        if otpVerifyType != .email  {
            lblOTPTypeTitle.text = "Enter the otp sent to your mobile"
            lblOTPType.text = "\(mobileNo)"
        }else {
            lblOTPTypeTitle.text = "Enter the otp sent to your email"
            lblOTPType.text = "\(email)"
        }
    }
    
    func startOTPTimer() {
        remainingTime = 30
        btnResend.isEnabled = false
        lblTimer.text = "\(remainingTime)s"

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            self.remainingTime -= 1
            lblTimer.text = "\(self.remainingTime)s"

            if self.remainingTime <= 0 {
                self.timer?.invalidate()
                self.btnResend.isEnabled = true
            }
        }
    }
    
    @IBAction func verifyOTP(_ sender: Any) {
        let otp = otpView.text ?? ""
        
        viewModel?.otpString = otp
        viewModel?.email = email
        viewModel?.mobileNo = mobileNo
        
        switch viewModel?.validateOTP(otp) {
        case .success:
            print("OTP Valid → Call Verify API")
            viewModel?.callOTPVerify(type: otpVerifyType ?? .moblile)
        case .failure(let message):
            Utilities.showSuccessAlert(message: message)
        case .none:
            print("None")
        }
    }
    
    @IBAction func resendOTP(_ sender: Any) {
        startOTPTimer()
    }    
}


extension OTPVC: OTPViewModelOutputProtocol {
    func didGeOTPResponse(response: LoginModel, error: String?) {
        if response.detail == "success"{
            AppSessionManager.shared.userModel = response
            if otpVerifyType != .forgotPassword{
                SessionManager.setLoggedIn()
                Coordinator.homeScreen()
            }else {
                // Goto Confirm Forgot password screen
            }
            
        }
    }
    
    func showLoadingIndicator() {
        Utilities.showIndicatorView()
    }
    
    func hideLoadingIndicator() {
        Utilities.hideIndicatorView()
    }
    
    func showErrorDialog(with error: String?) {
        
    }
}


extension OTPVC: DPOTPViewDelegate {
    func dpOTPViewAddText(_ text: String, at position: Int) {
        print("Typed:", text, "at:", position)
    }
    
    func dpOTPViewRemoveText(_ text: String, at position: Int) {
        print("Removed:", text, "at:", position)
    }
    
    func dpOTPViewChangePositionAt(_ position: Int) {
        print("Cursor at:", position)
    }
    
    func dpOTPViewBecomeFirstResponder() {
        print("Became first responder")
    }
    
    func dpOTPViewResignFirstResponder() {
        print("Resigned first responder")
    }
    
    // 🎯 Full OTP is captured here
    func dpOTPViewFilledOTP(_ otp: String) {
        print("FULL OTP:", otp)   // <<==== HERE YOU GET ALL DIGITS
    }
}
