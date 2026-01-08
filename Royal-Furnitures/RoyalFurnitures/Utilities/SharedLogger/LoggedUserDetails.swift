//
//  LoggedUserDetails.swift
//  Tablon
//
//  Created by Muneeb on 19/04/2022.
//

import Foundation
class LoggedUserDetails {
    static let shared = LoggedUserDetails()
//    private(set) var user: User?
//    
//    func saveUserProfile(user: User) {
//        let encoder = JSONEncoder()
//        let defaults = UserDefaults.standard
//        if let encoded = try? encoder.encode(user) {
//            self.user = user
//            defaults.set(encoded, forKey: UserDefaults.AppUserDefault.userProfile)
//        }
//    }
//    
//    @discardableResult
//    func retrieveUserProfile() -> User? {
//        if let userObject = UserDefaults.standard.object(forKey: UserDefaults.AppUserDefault.userProfile) as? Data {
//            let decoder = JSONDecoder()
//            if let userProfile = try? decoder.decode(User.self, from: userObject) {
//                self.user = userProfile
//                return userProfile
//            }
//        }
//        return nil
//    }
}
