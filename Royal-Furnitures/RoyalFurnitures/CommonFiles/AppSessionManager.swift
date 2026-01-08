//
//  AppSessionManager.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//

import Foundation

class AppSessionManager: NSObject {
    static let shared = AppSessionManager()
    private override init() {}
    
    
    var userModel:LoginModel?
    var homeData:HomeDataModel?
    
}
