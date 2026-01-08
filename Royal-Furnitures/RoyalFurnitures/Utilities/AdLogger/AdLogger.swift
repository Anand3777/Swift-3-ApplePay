//
//  AdLogger.swift
//  Mobile Classifieds(PEMS)
//
//  Created by Muneeb on 18/06/2022.
//

import Foundation
class AdLogger {
    static let shared = AdLogger()
//
//    var isEditableMode: Bool = false
//    private(set) var ad: AdDetailModel? {
//        didSet {
//            guard let ad = ad else {
//                UserDefaults.standard.removeObject(forKey: UserDefaults.AppUserDefault.adData)
//                return
//            }
//            saveAdsData(adsData: ad)
//        }
//    }
//}
//
//extension AdLogger {
//    func saveAdsData(adsData: AdDetailModel) {
//        let encoder = JSONEncoder()
//        let defaults = UserDefaults.standard
//        if let encoded = try? encoder.encode(adsData) {
//            defaults.set(encoded, forKey: UserDefaults.AppUserDefault.adData)
//        }
//    }
//
//    func retrieveAdsData() -> AdDetailModel? {
//        if let userObject = UserDefaults.standard.object(forKey: UserDefaults.AppUserDefault.adData) as? Data {
//            let decoder = JSONDecoder()
//            if let ads = try? decoder.decode(AdDetailModel.self, from: userObject) {
//                return ads
//            } else {
//                return nil
//            }
//        }
//        return nil
//    }
//
//    func updateAdsData(ads: AdDetailModel? = nil) {
//        self.ad = ads
//      //  NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RefreshPostView"), object: nil, userInfo: nil)
//
//    }
//
//    func removeUser() {
//        ad = nil
//    }
}
