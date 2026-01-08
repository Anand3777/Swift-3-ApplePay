//
//  LoginModel.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//


// MARK: - LoginModel
struct LoginModel: Codable {
    let version, detail, message: String?
    let data: LoginData?
    let meta: Meta?
}

// MARK: - DataClass
struct LoginData: Codable {
    let userID, email, phoneNumber: String?
    let tokens: Tokens?

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case email
        case phoneNumber = "phone_number"
        case tokens
    }
}

// MARK: - Tokens
struct Tokens: Codable {
    let refresh, access: String?
}


// MARK: - RegisterModel
struct RegisterModel: Codable {
    let version, detail, message: String?
    let data: RegisterData?
    let meta: Meta?
}

// MARK: - DataClass
struct RegisterData: Codable {
    let firstName, lastName, email, phoneNumber: String?
    let status: String?
    let allowNotification: Bool?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case phoneNumber = "phone_number"
        case status
        case allowNotification = "allow_notification"
    }
}

struct UserRequestModel {
    var email = ""
    var password = ""
    var mobile = ""
    var latitude = "12.9581836"
    var longitude = "80.2581419"
    var firstName = ""
    var lastName = ""
    var confirmPassword = ""
    var onboard_complete = true
    var allowNotification = true
    
    
}
