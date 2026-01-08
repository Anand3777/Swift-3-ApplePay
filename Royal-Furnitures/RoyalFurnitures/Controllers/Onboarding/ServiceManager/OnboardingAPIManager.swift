//
//  OnboardingAPIManager.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//

import Foundation
import Alamofire

// MARK: - Onboarding API Manager
class OnboardingAPIManager: APIManager {
    
    static let shared = OnboardingAPIManager()
    private override init() {}
    
    // Get list of countries/languages
    func getCountryList(completion: @escaping (Result<LanguageModel, AFError>) -> Void) {
        let request = OnboardingAPIRequest.getLanguage
        guard let url = request.fullURL else {
            print("Invalid URL")
            return
        }
        
        self.request(url: url,
                     method: request.method,
                parameters: request.parameters,
                headers: request.headers) { (result: Result<LanguageModel, AFError>) in
            completion(result)
        }
    }
    
    // Login via mobile
    func loginMobile(mobileNo: String, completion: @escaping (Result<LoginModel, AFError>) -> Void) {
        let request = OnboardingAPIRequest.loginMobile(mobileNo: mobileNo)
        guard let url = request.fullURL else {
            print("Invalid URL")
            return
        }
        self.request(url: url,
                     method: request.method,
                parameters: request.parameters,
                headers: request.headers) { (result: Result<LoginModel, AFError>) in
            completion(result)
        }
    }
    
    
    // Login via Email
    func loginEmail(email: String, completion: @escaping (Result<LoginModel, AFError>) -> Void) {
        let request = OnboardingAPIRequest.loginEmail(email: email)
        guard let url = request.fullURL else {
            print("Invalid URL")
            return
        }
        self.request(url: url,
                     method: request.method,
                parameters: request.parameters,
                headers: request.headers) { (result: Result<LoginModel, AFError>) in
            completion(result)
        }
    }
    
    // Login via Email
    func registerAPICall(userdata: UserRequestModel, completion: @escaping (Result<RegisterModel, AFError>) -> Void) {
        let request = OnboardingAPIRequest.register(userDetail: userdata)
        guard let url = request.fullURL else {
            print("Invalid URL")
            return
        }
        self.request(url: url,
                     method: request.method,
                parameters: request.parameters,
                headers: request.headers) { (result: Result<RegisterModel, AFError>) in
            completion(result)
        }
    }
    
    // Login via Email
    func loginWithPasswordAPICall(userdata: UserRequestModel, completion: @escaping (Result<LoginModel, AFError>) -> Void) {
        let request = OnboardingAPIRequest.loginWithPassword(email: userdata.email, password: userdata.password)
        guard let url = request.fullURL else {
            print("Invalid URL")
            return
        }
        self.request(url: url,
                     method: request.method,
                parameters: request.parameters,
                headers: request.headers) { (result: Result<LoginModel, AFError>) in
            completion(result)
        }
    }
    
    // Mobile Email OTP Verify
    func mobileOTPVerify(mobile: String,otp: String , completion: @escaping (Result<LoginModel, AFError>) -> Void) {
        let request = OnboardingAPIRequest.verifyMobileOTP(mobile: mobile, otp: otp)
        guard let url = request.fullURL else {
            print("Invalid URL")
            return
        }
        self.request(url: url,
                     method: request.method,
                parameters: request.parameters,
                headers: request.headers) { (result: Result<LoginModel, AFError>) in
            completion(result)
        }
    }
    
    // Mobile Email OTP Verify
    func emailOTPVerify(email: String,otp: String , completion: @escaping (Result<LoginModel, AFError>) -> Void) {
        let request = OnboardingAPIRequest.verifyEmailOTP(email: email, otp: otp)
        guard let url = request.fullURL else {
            print("Invalid URL")
            return
        }
        self.request(url: url,
                     method: request.method,
                parameters: request.parameters,
                headers: request.headers) { (result: Result<LoginModel, AFError>) in
            completion(result)
        }
    }
    
    // Mobile Email OTP Verify
    func verifyForgotPSWDOTP(mobile: String,otp: String , completion: @escaping (Result<LoginModel, AFError>) -> Void) {
        let request = OnboardingAPIRequest.verifyForgotPSWDOTP(mobile: mobile, otp: otp)
        guard let url = request.fullURL else {
            print("Invalid URL")
            return
        }
        self.request(url: url,
                     method: request.method,
                parameters: request.parameters,
                headers: request.headers) { (result: Result<LoginModel, AFError>) in
            completion(result)
        }
    }
    
    // Mobile Email OTP Verify
    func verifyRegisterOTP(mobile: String,otp: String , completion: @escaping (Result<LoginModel, AFError>) -> Void) {
        let request = OnboardingAPIRequest.registerValidate(mobile: mobile, otp: otp)
        guard let url = request.fullURL else {
            print("Invalid URL")
            return
        }
        self.request(url: url,
                     method: request.method,
                parameters: request.parameters,
                headers: request.headers) { (result: Result<LoginModel, AFError>) in
            completion(result)
        }
    }
    
    // Get list of countries/languages
    func getHome(completion: @escaping (Result<HomeResponseModel, AFError>) -> Void) {
        let request = OnboardingAPIRequest.homeAPI
        guard let url = request.fullURL else {
            print("Invalid URL")
            return
        }
        
        self.request(url: url,
                     method: request.method,
                parameters: request.parameters,
                headers: request.headers) { (result: Result<HomeResponseModel, AFError>) in
            completion(result)
        }
    }
    
}

