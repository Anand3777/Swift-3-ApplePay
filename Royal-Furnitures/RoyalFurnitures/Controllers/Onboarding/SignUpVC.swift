//
//  SignUpVC.swift
//  RoyalFurnitures
//
//  Created by Kanna on 05/11/25.
//

import UIKit
import CountryPickerView

class SignUpVC: UIViewController {

    
    let cpvInternal = CountryPickerView()
    @IBOutlet weak var dialCodeTxt: UITextField!
    @IBOutlet weak var dialCodeImg: UIImageView!
    
    @IBOutlet weak var vwSignUp: UIView!
    @IBOutlet weak var stackLogin: UIStackView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtPasswor: UITextField!
    @IBOutlet weak var txtConformPassword: UITextField!
    
    @IBOutlet weak var txtLoginEmail: UITextField!
    @IBOutlet weak var txtLoginPassword: UITextField!
    
    var viewModel: RegisterViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        // Do any additional setup after loading the view.
    }
    
    func configUI(){
        vwSignUp.isHidden = false
        stackLogin.isHidden = true
        viewModel = RegisterViewModel(output: self)
        
        let fields = [txtEmail, txtMobile, txtFirstName, txtLastName,txtPasswor,txtConformPassword,txtLoginEmail,txtLoginPassword]
        
        fields.forEach { $0?.setLeftPaddingPoints(10) }
    }
    
    @IBAction func countryCodeAction(_ sender: Any) {
        cpvInternal.delegate = self
        cpvInternal.showCountriesList(from: self)
    }

    
    @IBAction func loginSelected(_ sender: Any) {
        vwSignUp.isHidden = true
        stackLogin.isHidden = false
        btnSignUp.backgroundColor = .white
        btnLogin.backgroundColor = UIColor.lightRed
    }
    
    @IBAction func signUpSelected(_ sender: Any) {
        vwSignUp.isHidden = false
        stackLogin.isHidden = true
        btnLogin.backgroundColor = .white
        btnSignUp.backgroundColor = UIColor.lightRed
    }
    
    @IBAction func loginAction(_ sender: Any) {
        viewModel?.userDetail = UserRequestModel()
        viewModel?.userDetail.email = txtLoginEmail.text ?? ""
        viewModel?.userDetail.password = txtLoginPassword.text ?? ""
        
        switch viewModel?.validateFieldsLogin() {
        case .success:
            print("All fields are valid!")
            viewModel?.callLoginAPI()
        case .failure(let message):
            showAlert(message: message)
        case .none:
            print("None State")
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        viewModel?.userDetail = UserRequestModel()
        viewModel?.userDetail.firstName = txtFirstName.text ?? ""
        viewModel?.userDetail.lastName = txtLastName.text ?? ""
        viewModel?.userDetail.email = txtEmail.text ?? ""
        viewModel?.userDetail.mobile = (dialCodeTxt.text ?? "") + (txtMobile.text ?? "")
        viewModel?.userDetail.password = txtPasswor.text ?? ""
        viewModel?.userDetail.confirmPassword = txtConformPassword.text ?? ""
        
        switch viewModel?.validateFieldsRegister() {
        case .success:
            print("All fields are valid!")
            viewModel?.callRegisterAPI()
        case .failure(let message):
            showAlert(message: message)
        case .none:
            print("None State")
        }
    }
    
    @IBAction func loginWithMobile(_ sender: Any) {
        Coordinator.loginScreen(delegate: self, type: "mobile")
    }
    
    @IBAction func loginWithEmail(_ sender: Any) {
        Coordinator.loginScreen(delegate: self, type: "email")
    }
    
    @IBAction func forgotPWSD(_ sender: Any) {
        Coordinator.forgorPSWDScreen(delegate: self)
    }
    
    @IBAction func guestUser(_ sender: Any) {
        Coordinator.homeScreen()
    }
    
    private func showAlert(message: String) {
            let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
    }
}

extension SignUpVC: CountryPickerViewDelegate {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        self.dialCodeTxt.text = country.phoneCode
        self.dialCodeImg.image = country.flag
    }
}

extension SignUpVC: RegisterOutputProtocol {
    func didGetRegisterResponse(response: RegisterModel, error: String?) {
        if response.meta?.action == "register"{
            Coordinator.otpRegisterVerifyScreen(delegate: self, type: .register, email: viewModel?.userDetail.email ?? "", mobile: viewModel?.userDetail.mobile ?? "")
        }
    }
    
    func didGetAppleResponse(response: LoginModel, error: String?) {
        if response.detail == "success"{
            AppSessionManager.shared.userModel = response
            SessionManager.setLoggedIn()
            Coordinator.homeScreen()
        }
    }
    
    func didGetGoogleResponse(response: LoginModel, error: String?) {
        if response.detail == "success"{
            AppSessionManager.shared.userModel = response
            SessionManager.setLoggedIn()
            Coordinator.homeScreen()
        }
    }
    
    func didGetFaceBookResponse(response: LoginModel, error: String?) {
        if response.detail == "success"{
            AppSessionManager.shared.userModel = response
            SessionManager.setLoggedIn()
            Coordinator.homeScreen()
        }
    }
    
    func didGetLoginResponse(response: LoginModel, error: String?) {
        if response.detail == "success"{
            AppSessionManager.shared.userModel = response
            SessionManager.setLoggedIn()
            Coordinator.homeScreen()
        }
    }
    
    func showLoadingIndicator() {
        Utilities.showIndicatorView()
    }
    
    func hideLoadingIndicator() {
        Utilities.hideIndicatorView()
    }
    
    func showErrorDialog(with error: String?) {
        print("API Failed")
    }
}
