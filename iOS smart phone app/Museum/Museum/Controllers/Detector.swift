//
//  Detector.swift
//  Museum
//
//  Created by Weezy on 3/22/21.
//

import Foundation
import CoreLocation
import SwiftUI
import Alamofire

class Detector: NSObject, ObservableObject {
    
    var locationManager = CLLocationManager()
    var showAlert = false
    @Published var exhibits: [Exhibit] = [Exhibit]()
    @Published var lastDistance     = K.emptyString
    @Published var major : NSNumber = 0
    @Published var minor : NSNumber = 0
    @Published var beaconID         = K.emptyString
    @Published var titleString      = K.emptyString
    @Published var imageString      = K.defaultImage
    @Published var textDescription  = K.emptyString
    @Published var bgColor          = Color("Unknown")
    @Published var alert            = K.emptyString
    @Published var exhibitTitle     = K.emptyString
    @Published var roomTitle        = K.emptyString
    @Published var speech: String?  = K.emptyString
    @Published var floor : Int = 0
    @Published var location : Int = 0
    
    override init () {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        verifyPrivacyAuthorization()
    }
    
    func verifyPrivacyAuthorization() {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            startScanning()
        } else {
            showAlert = true
            alert = K.locationNeeded
            print("alert to change location settings")
        }
    }
    
    func startScanning() {
        
        guard let uuid = UUID(uuidString: K.uuid) else { return }
        
        let constraint = CLBeaconIdentityConstraint(uuid: uuid)
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: K.beaconID)
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(satisfying: constraint)
    }

    
    func update(distance: CLProximity) -> (color: Color, distance: String) {
        switch distance {
            case .immediate : return (Color("Immediate"), BeaconStatus.immediate.rawValue)
            case .near      : return (Color("Near"), BeaconStatus.near.rawValue)
            case .far       : return (Color("Far"), BeaconStatus.far.rawValue)
            default         : return (Color("Unknown"), BeaconStatus.unknown.rawValue)
        }
    }
    
} // end of Detector


extension Detector: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

        if status == .authorizedWhenInUse || status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        //Allow HTTPS request for self-signed certificate
        validateHTTPS()
        //Request JSON data from server

        
        let urlString = "https://10.28.148.205:8080/test"
        Alamofire.request(urlString).responseJSON { response in
            guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        self.exhibits = try decoder.decode([Exhibit].self, from: data)
//                        for i in 0..<exhibits.count{
//                            let beacon = exhibits[i].bluetoothBeacon.id
//                            print(beacon)
//                        }
                        
                        
                    } catch let error {
                        print("\(error)")
                    }
                }
        
        if let beacon = beacons.first {
            lastDistance = update(distance: beacon.proximity).distance
            bgColor      = update(distance: beacon.proximity).color
            major        = beacon.major
            minor        = beacon.minor
            beaconID     = beacon.description
            roomTitle    = "Room  \(beacon.major) - Exhibit \(beacon.minor)"
            
            for i in 0..<exhibits.count{
                if major.intValue == exhibits[i].bluetoothBeacon.major && minor.intValue == exhibits[i].bluetoothBeacon.minor{
                    exhibitTitle    = exhibits[i].author.name
                    titleString     = exhibits[i].name
                    imageString     = "Click"
                    speech          = exhibits[i].voiceDescription
                    floor           = exhibits[i].room.floor
                    location        = exhibits[i].room.location
                    textDescription = "Type: \(exhibits[i].type.type)\nStyle: \(exhibits[i].type.style)\nDate: \(exhibits[i].date)"
                }
            }
//            let key: String = String(describing: major) + "-" + String(describing: minor)
//
//            exhibitTitle    = K.dictExhibit[key]?.exhibit ?? K.emptyString
//            titleString     = K.dictExhibit[key]?.title ?? K.emptyString
//            imageString     = K.dictExhibit[key]?.image ?? K.defaultImage
//            textDescription = K.dictExhibit[key]?.description ?? K.emptyString
//            speech          = K.dictExhibit[key]?.speach ?? K.emptyString
        } else {
            lastDistance = BeaconStatus.unknown.rawValue
        }
    }
    
    
    func validateHTTPS(){
     
        let manager = SessionManager.default
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?
            
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            return (disposition, credential)
        }
    }

    
    
}


