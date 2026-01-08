//
//  LoginVC.swift
//  RoyalFurnitures
//
//  Created by Kanna on 25/10/25.
//

import UIKit
import CountryPickerView

class LoginVC: UIViewController {

    let cpvInternal = CountryPickerView()
    @IBOutlet weak var dialCodeTxt: UITextField!
    @IBOutlet weak var dialCodeImg: UIImageView!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblEnterDetailDic: UILabel!
    @IBOutlet weak var vwMobile: UIView!

    var selectedLogin = "email"
    var viewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = LoginViewModel(output: self)
        configUI()
    }

    func configUI() {
        let fields = [txtEmail, txtMobile]
        
        fields.forEach { $0?.setLeftPaddingPoints(10) }
        if selectedLogin == "email" {
            emailSelected()
        }else {
            mobileSelected()
        }
    }
    
    func emailSelected() {
        lblTitle.text = "Login with your email"
        lblEnterDetailDic.text = "Enter your Email ID"
        vwMobile.isHidden = true
        txtEmail.isHidden = false
    }
    
    func mobileSelected() {
        vwMobile.isHidden = false
        txtEmail.isHidden = true
        lblTitle.text = "Login with your mobile"
        lblEnterDetailDic.text = "Enter your mobile Number"
    }
    
    @IBAction func countryCodeAction(_ sender: Any) {
        cpvInternal.delegate = self
        cpvInternal.showCountriesList(from: self)
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        viewModel?.userDetail.email = txtEmail.text ?? ""
        viewModel?.userDetail.mobile = (dialCodeTxt.text ?? "") + (txtMobile.text ?? "")
        
        if selectedLogin == "email" {
            viewModel?.loginEmailAPI()
        }else {
            viewModel?.loginMobileAPI()
        }
    }
    
    @IBAction func guestUser(_ sender: Any) {
        Coordinator.homeScreen()
    }
    
}

extension LoginVC: CountryPickerViewDelegate {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        self.dialCodeTxt.text = country.phoneCode
        self.dialCodeImg.image = country.flag
    }
}

extension LoginVC: LoginOutputProtocol {
    func didGetLoginMobileResponse(response: LoginModel, error: String?) {
        if response.detail == "success"{
            AppSessionManager.shared.userModel = response
            Coordinator.otpRegisterVerifyScreen(delegate: self, type: .moblile, email: viewModel?.userDetail.email ?? "", mobile: viewModel?.userDetail.mobile ?? "")
        }
    }
    
    func didGetLoginEmailResponse(response: LoginModel, error: String?) {
        if response.detail == "success"{
            AppSessionManager.shared.userModel = response
            Coordinator.otpRegisterVerifyScreen(delegate: self, type: .email, email: viewModel?.userDetail.email ?? "", mobile: viewModel?.userDetail.mobile ?? "")
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
