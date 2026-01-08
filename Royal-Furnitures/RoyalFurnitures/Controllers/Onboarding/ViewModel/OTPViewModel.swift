//
//  OTPViewModel.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//

import Foundation


protocol OTPViewModelOutputProtocol: AnyObject {
    func didGeOTPResponse(response: LoginModel, error: String?)

    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showErrorDialog(with error: String?)
}

protocol OTPViewModelInputProtocol: AnyObject {
    func callOTPVerify(type: OTPVerifyType)
}

class OTPViewModel: OTPViewModelInputProtocol {
    var email = ""
    var mobileNo = ""
    var otpString = ""
    
    weak var presenterOutput: OTPViewModelOutputProtocol?
    
    init(output: OTPViewModelOutputProtocol) {
        presenterOutput = output
    }

    func validateOTP(_ otp: String) -> ValidationResult {
        // Empty check
        guard !otp.isEmpty else {
            return .failure("Please enter OTP")
        }
        
        // Length check (Set your OTP length: 4 or 6)
        guard otp.count == 5 else {
            return .failure("OTP should be 5 digits")
        }
        
        // Numeric check
        guard CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: otp)) else {
            return .failure("OTP should contain only numbers")
        }
        
        return .success
    }
    
    func callOTPVerify(type: OTPVerifyType) {
        self.presenterOutput?.showLoadingIndicator()
        switch type {
        case .email:
            OnboardingAPIManager.shared.emailOTPVerify(email: email,otp: otpString) { result in
                self.presenterOutput?.hideLoadingIndicator()
                switch result {
                case .success(let modelObj):
                    // Handle the successful response
                    self.presenterOutput?.didGeOTPResponse(response: modelObj, error: nil)
                case .failure(let error):
                    // Handle the error
                    print("Failed \(error.localizedDescription)")
                }
            }
            
        case .moblile:
            OnboardingAPIManager.shared.mobileOTPVerify(mobile: mobileNo,otp: otpString) { result in
                self.presenterOutput?.hideLoadingIndicator()
                switch result {
                case .success(let modelObj):
                    // Handle the successful response
                    self.presenterOutput?.didGeOTPResponse(response: modelObj, error: nil)
                case .failure(let error):
                    // Handle the error
                    print("Failed \(error.localizedDescription)")
                }
            }
        case .register:
            OnboardingAPIManager.shared.verifyRegisterOTP(mobile: mobileNo,otp: otpString) { result in
                self.presenterOutput?.hideLoadingIndicator()
                switch result {
                case .success(let modelObj):
                    // Handle the successful response
                    self.presenterOutput?.didGeOTPResponse(response: modelObj, error: nil)
                case .failure(let error):
                    // Handle the error
                    print("Failed \(error.localizedDescription)")
                }
            }
        case .forgotPassword:
            OnboardingAPIManager.shared.verifyForgotPSWDOTP(mobile: mobileNo,otp: otpString) { result in
                self.presenterOutput?.hideLoadingIndicator()
                switch result {
                case .success(let modelObj):
                    // Handle the successful response
                    self.presenterOutput?.didGeOTPResponse(response: modelObj, error: nil)
                case .failure(let error):
                    // Handle the error
                    print("Failed \(error.localizedDescription)")
                }
            }
        }
    }
    
}
