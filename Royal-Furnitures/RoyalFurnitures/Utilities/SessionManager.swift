//
//  SessionManager.swift
//  Utils
//
//  Created by A2 MacBook Pro 2012 on 17/06/20.
//  Copyright © 2020 A2 MacBook Pro 2012. All rights reserved.
//

import UIKit
//import Firebase


class SessionManager {
    
    class func isLoggedIn() -> Bool {
        guard let isLoggedIn = UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool else { return false }
        return isLoggedIn
    }
    class func isSkip() -> Bool {
        guard let isLoggedIn = UserDefaults.standard.value(forKey: "isSkip") as? Bool else { return false }
        return isLoggedIn
    }
    
    class func isLocationSet() -> Bool {
        guard let isLocationSet = UserDefaults.standard.value(forKey: "isLocationSet") as? Bool else { return false }
        return isLocationSet
    }
    
//    class func getUserData() -> User? {
//        guard let data = UserDefaults.standard.object(forKey: "UserDetails") as? Data else { return nil }
//        guard let userDict = NSKeyedUnarchiver.unarchiveObject(with: data) as? [String : Any] else { return nil }
//        do {
//            let json = try JSONSerialization.data(withJSONObject: userDict)
//            let object = try JSONDecoder().decode(User.self, from: json)
//            return object
//        } catch let err {
//            print(err)
//            return nil
//        }
//    }
    
    class func setLoggedIn() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
    }
    class func setSkipIn(isSkip: Bool) {
        UserDefaults.standard.set(isSkip, forKey: "isSkip")
        UserDefaults.standard.synchronize()
    }
    
    class func setSocialLogin(isSocialLogin: Bool) {
        UserDefaults.standard.set(isSocialLogin, forKey: "isSocialLogin")
        UserDefaults.standard.synchronize()
    }
    
   
    class func getCountry() -> String {
        guard let isLoggedIn = UserDefaults.standard.value(forKey: "country") as? String else { return "" }
        return isLoggedIn
    }
   
    class func getSkip() -> Bool {
        guard let isSocialLogin = UserDefaults.standard.value(forKey: "isSkip") as? Bool else { return false }
        return isSocialLogin
    }
    
    class func setLocation() {
        UserDefaults.standard.set(true, forKey: "isLocationSet")
        UserDefaults.standard.synchronize()
    }
    
    class func setUserData(dictionary: [String: Any]) {
        UserDefaults.standard.set( try? NSKeyedArchiver.archivedData(withRootObject: dictionary, requiringSecureCoding: false), forKey: "UserDetails")
        UserDefaults.standard.synchronize()
    }
    
    class func setCurrentLocation(_ latitude: String,_ longitude: String?) {
        UserDefaults.standard.set(latitude, forKey: "latitude")
        UserDefaults.standard.set(longitude, forKey: "longitude")
        UserDefaults.standard.synchronize()
    }
    
    class func getCurrentLocation() -> (String, String)? {
        let dubaiCoordiantes = ("", "")
        guard let latitude = UserDefaults.standard.value(forKey: "latitude") as? String else { return dubaiCoordiantes }
        guard let longitude = UserDefaults.standard.value(forKey: "longitude") as? String else { return dubaiCoordiantes }
       // return (String(latitude.prefix(7)), String(longitude.prefix(7)))
        return (String(latitude), String(longitude))
    }
    
    class func clearLoginSession() {
       // UserDefaults.standard.set(nil, forKey: "FCM_Token")
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.set(nil, forKey: "UserDetails")
        UserDefaults.standard.removeObject(forKey: "AllSavedContacts")
        UserDefaults.standard.removeObject(forKey: "contacts")
        UserDefaults.standard.removeObject(forKey: "setUserType")
        UserDefaults.standard.removeObject(forKey: "setActivityType")
        UserDefaults.standard.removeObject(forKey: "setBusinessType")
        //UserDefaults.standard.removeObject(forKey: "latitude")
     //   UserDefaults.standard.removeObject(forKey: "longitude")
        UserDefaults.standard.set(nil, forKey: "Access_Token")
        UserDefaults.standard.synchronize()
//        let instance = InstanceID.instanceID()
//        instance.deleteID { (error) in
//            print(error.debugDescription)
//        }
    }
    
    open class func setUserAccessToken(token: String) {
        UserDefaults.standard.setValue(token, forKey: "Access_Token")
        UserDefaults.standard.synchronize()
    }
    
    open class func getUserAccessToken() -> String? {
        guard let accessToken = UserDefaults.standard.value(forKey: "Access_Token") as? String else {
            return ""
        }
        return accessToken
    }
    
    class func getCartId() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    open class func setFCMToken(token: String) {
        UserDefaults.standard.setValue(token, forKey: "FCM_Token")
        UserDefaults.standard.synchronize()
    }
    
    open class func getFCMToken() -> String? {
        guard let fcmToken = UserDefaults.standard.value(forKey: "FCM_Token") as? String else {
            return "abdhjef ekef kjwf wedfw"
        }
        return fcmToken
    }
    
    open class func setUserType(userType: String) {
        UserDefaults.standard.setValue(userType, forKey: "setUserType")
        UserDefaults.standard.synchronize()
    }
    open class func setActivityType(userType: String) {
        UserDefaults.standard.setValue(userType, forKey: "setActivityType")
        UserDefaults.standard.synchronize()
    }
    open class func setBusinessType(userType: String) {
        UserDefaults.standard.setValue(userType, forKey: "setBusinessType")
        UserDefaults.standard.synchronize()
    }
    
    open class func getUserType() -> String? {
        guard let fcmToken = UserDefaults.standard.value(forKey: "setUserType") as? String else {
            return ""
        }
        return fcmToken
    }
    
    open class func getActivityType() -> String? {
        guard let fcmToken = UserDefaults.standard.value(forKey: "setActivityType") as? String else {
            return ""
        }
        return fcmToken
    }
    open class func getBusinessType() -> String? {
        guard let fcmToken = UserDefaults.standard.value(forKey: "setBusinessType") as? String else {
            return ""
        }
        return fcmToken
    }
    
    class func setWelcomeScreenShown() {
        UserDefaults.standard.set(true, forKey: "welcomeScreenShown")
        UserDefaults.standard.synchronize()
    }
    
    class func isWelcomeScreenShown() -> Bool {
        guard let status = UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool else { return false }
        return status
    }
    
}
