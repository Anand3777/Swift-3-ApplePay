//
//  LocationManager.swift
//  CSRViews
//
//  Created by Muneeb on 09/08/2021.
//  Copyright © 2021 Muneeb. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

enum LocationManagerError: Error {
    case restriction(String)
}

class LocationManager: NSObject {
    
    static var shared: LocationManager = LocationManager()
    
    var lastLocation: CLLocation?
    
    private override init() {}
    

    private(set) var isActive = false
    
    var didRecieveLocationUpdate: ((CLLocation) -> Void)?
    var didChangeAuthorizationStatus: ((Bool) -> Void)?
    
    var authorized: Bool = false {
        didSet {
            didChangeAuthorizationStatus?(authorized)
        }
    }
    
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()

    
    func startMonitoring(_ completion: ((Bool?, LocationManagerError?) -> Void)? = nil) {
        if enableLocationServices() {
            isActive = true
            completion?(true, nil)
        } else {
            completion?(false, LocationManagerError.restriction(NSLocalizedString("Can't observe location changes due to user restrictions", comment: "")))
        }
    }
    
    func stopMonitoring() {
        isActive = false
        locationManager.stopUpdatingLocation()
    }
    
    
     func enableLocationServices() -> Bool {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            return true
            
        case .restricted, .denied:
            return false
            
        case .authorizedWhenInUse, .authorizedAlways:
            startRecievingLocationChanges()
            authorized = true
            return true
            
        @unknown default:
            return false
        }
    }
    
    func startRecievingLocationChanges() {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
            return
        }
        
//        if !CLLocationManager.locationServicesEnabled() {
//            return
//        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 100.0
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.last
        didRecieveLocationUpdate?(locations.last!)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedAlways:
            startRecievingLocationChanges()
            authorized = true
        case .authorizedWhenInUse:
            authorized = true
        case .restricted, .denied:
           // AppDelegate.shared.mainController?.showLocationRequiredAlert()
            authorized = false
            break
            
        case .notDetermined:
            break
            
        @unknown default:
            break
        }
    }
}
