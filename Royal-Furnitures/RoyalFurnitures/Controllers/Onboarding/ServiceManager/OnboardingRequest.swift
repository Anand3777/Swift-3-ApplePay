//
//  OnboardingRequest.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//

import Foundation
import Alamofire

enum OnboardingAPIRequest {
    case loginMobile(mobileNo: String)
    case loginEmail(email: String)
    case getLanguage
    case getOnbaording
    
    case register(userDetail: UserRequestModel)
    case registerValidate(mobile: String, otp: String)
    case loginWithPassword(email: String, password: String)
    
    case verifyMobileOTP(mobile: String, otp: String)
    case verifyEmailOTP(email: String, otp: String)
    case verifyForgotPSWDOTP(mobile: String, otp: String)
    
    case resendForgotPSWDOTP(mobile: String)
    case confirmPassword(mobile: String, password: String, confirmPassword: String)
    case forgotMobilePassword(mobileNo: String)
    case forgotEmailPassword(email: String)
    
    case refreshToken
    case lognFaceBook
    case loginGoogle
    case loginApple
    case homeAPI

    
    var baseURL: String { ApiUrlEndPointConstants.baseUrl }
    
    var path: String {
        switch self {
        case .loginMobile: return ApiUrlEndPointConstants.loginMobile
        case .loginEmail: return ApiUrlEndPointConstants.loginEmail
        case .getLanguage: return ApiUrlEndPointConstants.getLanguage
            
            
        case .register: return ApiUrlEndPointConstants.register
        case .verifyForgotPSWDOTP:
            return ApiUrlEndPointConstants.verifyForgotPSWDOTP
        case .getOnbaording:
            return ApiUrlEndPointConstants.getOnbaording
        case .registerValidate:
            return ApiUrlEndPointConstants.registerValidate
        case .loginWithPassword:
            return ApiUrlEndPointConstants.loginWithPassword
        case .verifyMobileOTP:
            return ApiUrlEndPointConstants.verifyMobileOTP
        case .verifyEmailOTP:
            return ApiUrlEndPointConstants.verifyEmailOTP
        case .resendForgotPSWDOTP:
            return ApiUrlEndPointConstants.resendForgotPSWDOTP
        case .confirmPassword:
            return ApiUrlEndPointConstants.confirmPassword
        case .forgotMobilePassword:
            return ApiUrlEndPointConstants.forgotMobilePassword
        case .forgotEmailPassword:
            return ApiUrlEndPointConstants.forgotEmailPassword
        case .refreshToken:
            return ApiUrlEndPointConstants.refreshToken
        case .lognFaceBook:
            return ApiUrlEndPointConstants.lognFaceBook
        case .loginGoogle:
            return ApiUrlEndPointConstants.loginGoogle
        case .loginApple:
            return ApiUrlEndPointConstants.loginApple
        case .homeAPI:
            return ApiUrlEndPointConstants.homeAPI
        }
    }
    
    var fullURL: String? {
        URL(string: baseURL + path)?.absoluteString
    }
    
    var parameters: Parameters? {
        switch self {
        case .loginMobile(let mobileNo):
            return ["phone_number": mobileNo]
        case .loginEmail(let email):
            return ["email": email]
        case .getLanguage:
            return nil
        case .getOnbaording:
            return nil
        case .register(userDetail: let userDetail):
            return getRegisterParams(userDetail: userDetail)
        case .registerValidate(mobile: let mobile, otp: let otp):
            return ["phone_number": mobile,
                    "otp": otp]
        case .loginWithPassword(email: let email, password: let password):
            return ["email": email,
                    "password": password]
        case .verifyMobileOTP(mobile: let mobile, otp: let otp):
            return ["phone_number": mobile,
                    "otp": otp]
        case .verifyEmailOTP(email: let email, otp: let otp):
            return ["email": email,
                    "otp": otp]
        case .verifyForgotPSWDOTP(mobile: let mobile, otp: let otp):
            return ["phone_number": mobile,
                    "otp": otp]
        case .resendForgotPSWDOTP(mobile: let mobile):
            return ["phone_number": mobile]
        case .confirmPassword(mobile: let mobile, password: let password, confirmPassword: let confirmPassword):
            return ["phone_number": mobile,
                    "password": password,
                    "confirmPassword": confirmPassword]
        case .forgotMobilePassword(mobileNo: let mobileNo):
            return ["phone_number": mobileNo]
        case .forgotEmailPassword(email: let email):
            return ["email": email]
        case .refreshToken:
            return nil
        case .lognFaceBook:
            return nil
        case .loginGoogle:
            return nil
        case .loginApple:
            return nil
        case .homeAPI:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .loginMobile:
            return .post
        case .loginEmail:
            return .post
        case .getLanguage:
            return .get
        case .getOnbaording:
            return .get
        case .register:
            return .post
        case .registerValidate:
            return .post
        case .loginWithPassword:
            return .post
        case .verifyMobileOTP:
            return .post
        case .verifyEmailOTP:
            return .post
        case .verifyForgotPSWDOTP:
            return .post
        case .resendForgotPSWDOTP:
            return .post
        case .confirmPassword:
            return .post
        case .forgotMobilePassword:
            return .post
        case .forgotEmailPassword:
            return .post
        case .refreshToken:
            return .post
        case .lognFaceBook:
            return .post
        case .loginGoogle:
            return .post
        case .loginApple:
            return .post
        case .homeAPI:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        ["Content-Type": "application/json"]  // <-- HTTPHeaders type
    }
    
    func getRegisterParams(userDetail: UserRequestModel) -> [String: Any] {
        return [
            "first_name": userDetail.firstName,
            "last_name": userDetail.lastName,
            "email": userDetail.email,
            "phone_number": userDetail.mobile,
            "password": userDetail.password,
            "confirm_password": userDetail.confirmPassword,
            "allow_notification": userDetail.allowNotification,
            "country_id": "1",
            "latitude": userDetail.latitude,
            "longitude": userDetail.longitude,
            "onboard_complete": userDetail.onboard_complete
        ]
    }

}
