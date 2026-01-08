//
//  RegisterViewModel.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//

import UIKit
import Foundation

protocol RegisterOutputProtocol: AnyObject {
    func didGetLoginResponse(response: LoginModel, error: String?)
    func didGetRegisterResponse(response: RegisterModel, error: String?)
    
    func didGetAppleResponse(response: LoginModel, error: String?)
    func didGetGoogleResponse(response: LoginModel, error: String?)
    func didGetFaceBookResponse(response: LoginModel, error: String?)
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showErrorDialog(with error: String?)
}

protocol RegisterInputProtocol: AnyObject {
    func callLoginAPI()
    func callRegisterAPI()
    func appleLogin()
    func facebookLogin()
    func googleLogin()
}

class RegisterViewModel: RegisterInputProtocol {
    
    var userDetail = UserRequestModel()
    
    weak var presenterOutput: RegisterOutputProtocol?
    
    init(output: RegisterOutputProtocol) {
        presenterOutput = output
    }
    
    func callRegisterAPICall() {
        print("Call Home API")
    }
    
    func validateFieldsRegister() -> ValidationResult {
        
         let userData = userDetail
        
        // First Name
        guard !userData.firstName.isEmpty else {
            return .failure("Please enter first name")
        }
        
        // Last Name
        guard !userData.lastName.isEmpty else {
            return .failure("Please enter last name")
        }
        
        // Email
        guard !userData.email.isEmpty else {
            return .failure("Please enter email")
        }
        
        guard isValidEmail(userData.email) else {
            return .failure("Please enter a valid email")
        }
        
        // Mobile
        guard !userData.mobile.isEmpty else {
            return .failure("Please enter mobile number")
        }
        
        
        // Password
        guard !userData.password.isEmpty else {
            return .failure("Please enter password")
        }
        
        guard !userData.confirmPassword.isEmpty else {
            return .failure("Please confirm password")
        }
        
        guard userData.password == userData.confirmPassword else {
            return .failure("Passwords do not match")
        }
        
        return .success
    }
    
    func validateFieldsLogin() -> ValidationResult {
        
         let userData = userDetail
        
        // Email
        guard !userData.email.isEmpty else {
            return .failure("Please enter email")
        }
        guard isValidEmail(userData.email) else {
            return .failure("Please enter a valid email")
        }
       
        // Password
        guard !userData.password.isEmpty  else {
            return .failure("Please enter password")
            
        }
        guard userData.password.count > 5  else {
            return .failure("Please enter minimum 5 character in password")
        }
        
        return .success
    }
    
    // Email validation
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
   
    func callLoginAPI() {
        self.presenterOutput?.showLoadingIndicator()
        OnboardingAPIManager.shared.loginWithPasswordAPICall(userdata: userDetail) { result in
            self.presenterOutput?.hideLoadingIndicator()
            switch result {
            case .success(let modelObj):
                // Handle the successful response
                self.presenterOutput?.didGetLoginResponse(response: modelObj, error: nil)
            case .failure(let error):
                // Handle the error
                print("Failed \(error.localizedDescription)")
            }
        }
    }
    
    func callRegisterAPI() {
        self.presenterOutput?.showLoadingIndicator()
        OnboardingAPIManager.shared.registerAPICall(userdata: userDetail) { result in
            self.presenterOutput?.hideLoadingIndicator()
            switch result {
            case .success(let modelObj):
                // Handle the successful response
                self.presenterOutput?.didGetRegisterResponse(response: modelObj, error: nil)
            case .failure(let error):
                // Handle the error
                print("Failed \(error.localizedDescription)")
            }
        }
    }
    
    func appleLogin() {
        
    }
    
    func facebookLogin() {
        
    }
    
    func googleLogin() {
        
    }
    
    func loginEmailAPI() {
        self.presenterOutput?.showLoadingIndicator()
        OnboardingAPIManager.shared.loginEmail(email: userDetail.email) { result in
            self.presenterOutput?.hideLoadingIndicator()
            switch result {
            case .success(let languageModel):
                // Handle the successful response
                print("Received language list: \(String(describing: languageModel.detail))")
            case .failure(let error):
                // Handle the error
                print("Failed to fetch languages: \(error.localizedDescription)")
            }
        }
    }
    
    func loginMobileAPI() {
        self.presenterOutput?.showLoadingIndicator()
        OnboardingAPIManager.shared.loginMobile(mobileNo: userDetail.mobile) { result in
            self.presenterOutput?.hideLoadingIndicator()
            switch result {
            case .success(let languageModel):
                // Handle the successful response
                print("Received language list: \(String(describing: languageModel.detail))")
            case .failure(let error):
                // Handle the error
                print("Failed to fetch languages: \(error.localizedDescription)")
            }
        }
    }
    
}


enum ValidationResult {
    case success
    case failure(String)
}
