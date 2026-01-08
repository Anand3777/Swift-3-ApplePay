//
//  LoginViewModel.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//



import UIKit
import Foundation

protocol LoginOutputProtocol: AnyObject {    
    func didGetLoginMobileResponse(response: LoginModel, error: String?)
    func didGetLoginEmailResponse(response: LoginModel, error: String?)

    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showErrorDialog(with error: String?)
}

protocol LoginInputProtocol: AnyObject {
    func loginEmailAPI()
    func loginMobileAPI()
}

class LoginViewModel: LoginInputProtocol {
    
    var userDetail = UserRequestModel()
    weak var presenterOutput: LoginOutputProtocol?
    
    init(output: LoginOutputProtocol) {
        presenterOutput = output
    }
   
    func validateMobile() -> ValidationResult {
        let userData = userDetail
        // Mobile
        guard !userData.mobile.isEmpty else {
            return .failure("Please enter mobile number")
        }
        
        
        return .success
    }
    
    func validateEmail() -> ValidationResult {
         let userData = userDetail
        // Email
        guard !userData.email.isEmpty else {
            return .failure("Please enter email")
        }
        guard isValidEmail(userData.email) else {
            return .failure("Please enter a valid email")
        }
        return .success
    }
    
    // Email validation
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
   
   
    
    func loginEmailAPI() {
        self.presenterOutput?.showLoadingIndicator()
        OnboardingAPIManager.shared.loginEmail(email: userDetail.email) { result in
            self.presenterOutput?.hideLoadingIndicator()
            switch result {
            case .success(let languageModel):
                // Handle the successful response
                print("Received language list: \(String(describing: languageModel.detail))")
                self.presenterOutput?.didGetLoginEmailResponse(response: languageModel, error: nil)
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
                self.presenterOutput?.didGetLoginMobileResponse(response:languageModel, error: nil)
            case .failure(let error):
                // Handle the error
                print("Failed to fetch languages: \(error.localizedDescription)")
            }
        }
    }
    
}
