//
//  SelectLangVC.swift
//  RoyalFurnitures
//
//  Created by Kanna on 04/11/25.
//

import UIKit
import UserNotifications
import CoreLocation

class SelectLangVC: BaseViewController,UNUserNotificationCenterDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var tbl: UITableView?
    private let locationManager = CLLocationManager()
    var arrLang = ["UAE  - English","عربي - الإمارات","Oman - English","عربي - عمان"]
    var arrCountry = ["uaeLogo","uaeLogo","omanLogo","omanLogo"]
    var selectedLandIndex = 0
    
    override func viewDidLoad()  {
        super.viewDidLoad()
         configUI()
        getCountryListAPI()
     //   loginEmailAPI()
        // Do any additional setup after loading the view.
    }
    
    func configUI() {
        tbl?.delegate = self
        tbl?.dataSource = self
        tbl?.register(UINib(nibName: "SelectLangCell", bundle: nil), forCellReuseIdentifier: "SelectLangCell")
        
    }
    
    func requestNotificationPermission() async  {
        let center = UNUserNotificationCenter.current()
        do {
            try await center.requestAuthorization(options: [.alert, .sound, .badge])
        } catch {
            // Handle the error here.
        }
    }
    
    func requestLocationPermission() {
           locationManager.requestWhenInUseAuthorization()
           // OR:
           // locationManager.requestAlwaysAuthorization()
       }
    
    func getCountryListAPI() {
        OnboardingAPIManager.shared.getCountryList { result in
            switch result {
            case .success(let languageModel):
                // Handle the successful response
                print("Received language list: \(languageModel.data?.count)")
            case .failure(let error):
                // Handle the error
                print("Failed to fetch languages: \(error.localizedDescription)")
            }
        }
    }
    
//    func loginEmailAPI() {
//        OnboardingAPIManager.shared.loginEmail(email: "ananthup888@gmail.com") { result in
//            switch result {
//            case .success(let languageModel):
//                // Handle the successful response
//                print("Received language list: \(languageModel.detail)")
//            case .failure(let error):
//                // Handle the error
//                print("Failed to fetch languages: \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func loginMobileAPI() {
//        OnboardingAPIManager.shared.loginMobile(mobileNo:  "+919995047363") { result in
//            switch result {
//            case .success(let languageModel):
//                // Handle the successful response
//                print("Received language list: \(languageModel.detail)")
//            case .failure(let error):
//                // Handle the error
//                print("Failed to fetch languages: \(error.localizedDescription)")
//            }
//        }
//    }
    
    @IBAction func continueAction(_sender: UIButton) {
        Task { @MainActor in
            await requestNotificationPermission()
            Coordinator.IntroScreen()
        }
    }
    
    @IBAction func allowLocation(_sender: UIButton) {
        requestLocationPermission()
      //  Coordinator.IntroScreen()
    }
    
    @IBAction func enterManually(_sender: UIButton) {
      //  Coordinator.IntroScreen()
    }
    
    @IBAction func allowNotification(_sender: UIButton) {
      //  Coordinator.IntroScreen()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           switch status {
           case .authorizedAlways:
               print("Location authorized always")
           case .authorizedWhenInUse:
               print("Location authorized when in use")
           case .denied, .restricted:
               print("Location permission denied")
           case .notDetermined:
               print("Location not determined")
           @unknown default:
               break
           }
       }

}

extension SelectLangVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrLang.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectLangCell", for: indexPath) as! SelectLangCell
        cell.selectionStyle = .none
        cell.lblLangName?.text = arrLang[indexPath.row]
        cell.imgSelected?.image = selectedLandIndex == indexPath.row ? UIImage(named: "selected") : UIImage(named: "unSelect")
        cell.imgLogo?.image = UIImage(named: arrCountry[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Coordinator.rideWatingScreen(delegate: self)
        DispatchQueue.main.async {
            self.selectedLandIndex = indexPath.row
            self.tbl?.reloadData()
        }
    }
    
}
