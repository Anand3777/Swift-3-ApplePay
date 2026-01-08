//
//  APIConstant.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//
import Foundation
import Alamofire



struct HeaderConstants {
    static let contentType  = "Content-Type"
    static let contentTypeValue  = "application/json"
    static let bearerToken  = "BearerToken"

}


enum ApiUrlEndPointConstants {
    static let baseUrl = "http://16.171.63.244/api/"

    
    ///Splash screen
    static let getLanguage     = "users/country-language-options/"
    static let getOnbaording   = "users/onboarding-screen/"
   
    //register
    static let register        = "users/auth/register/"
    static let registerValidate = "users/auth/verify-otp/"
    
    //login
    static let loginEmail      = "users/login/email-login/"
    static let loginWithPassword  = "users/login/login-with-password/"
    static let loginMobile     = "users/login/phone-login/"
    
    //verify
    static let verifyMobileOTP = "users/login/verify-otp-login/"
    static let verifyEmailOTP  = "users/login/verify-otp-login/"
    
    //forgot Password
    static let forgotEmailPassword  = "users/forgot-password/send-reset-link/"
    static let forgotMobilePassword  = "users/forgot-password/send-otp/"
    static let verifyForgotPSWDOTP  = "users/forgot-password/verify-otp/"
    
    static let resendForgotPSWDOTP = "users/forgot-password/resend-otp/"
    static let confirmPassword = "users/forgot-password/reset-password-sms/"
    

    static let refreshToken = "users/token/refresh/"
    
    //Social Login
    static let lognFaceBook = "users/auth/social/"
    static let loginGoogle = ""
    static let loginApple = "api/auth/apple-login/ "
    
    // Home API
    static let homeAPI = "products/home/?country_id=2"

}




typealias DirectEncodingType = Alamofire.ParameterEncoding
typealias HeaderParams = [String: String]
typealias APIParams    = [String: Any]

enum ResponseType {
    case json, xml
}
/* DirectApiEndpoint protocol defines a set a rules, on conforming to which, a type can
 be classfied as a API request */
protocol DirectApiEndpoint {
    var baseURL: String? { get }  // base url of the request
    var path: String? { get }  // path component of the url
    var method: Alamofire.HTTPMethod? { get }  // HTTP Method (e.g. GET, POST etc)
    var headers: HeaderParams? { get }  // Header parameters
    var parameters: APIParams? { get }  // Request Body/ Query Params
    var encoding: DirectEncodingType? { get }  // URL encoding for the request
    var responseType: ResponseType? { get }  // response data type from the request
}

extension DirectApiEndpoint {
    internal var baseURL: String? { return "" }
    internal var path: String? { return nil }
    internal var method: Alamofire.HTTPMethod? { return .get }
    internal var headers: HeaderParams? { return [HeaderConstants.contentTypeValue : HeaderConstants.contentType] }
    internal var parameters: APIParams? { return nil }
    internal var encoding: DirectEncodingType? { return Alamofire.JSONEncoding.default }
    var responseType: ResponseType? { return ResponseType.json }
}

