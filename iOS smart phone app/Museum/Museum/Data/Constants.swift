//
//  Constants.swift
//  Museum
//
//  Created by Weezy on 3/10/21.
//

import Foundation
import CoreLocation

//MARK: Enums
//// Status of beacon's location relative to the beacon detector(this app)
enum BeaconStatus: String {
    case unknown   = "Unknown"
    case immediate = "Here"
    case near      = "Nearby"
    case far       = "Far Away"
}

////  List of english speakers. 
enum EnglishSpeakers : String {
    case catherine = "com.apple.ttsbundle.siri_female_en-AU_compact"
    case gordon    = "com.apple.ttsbundle.siri_male_en-AU_compact"
    case karen     = "com.apple.ttsbundle.Karen-compact"
    case arthur    = "com.apple.ttsbundle.siri_male_en-GB_compact"
    case daniel    = "com.apple.ttsbundle.Daniel-compact"
    case martha    = "com.apple.ttsbundle.siri_female_en-GB_compact"
    case moira     = "com.apple.ttsbundle.Moira-compact"
    case rishi     = "com.apple.ttsbundle.Rishi-compact"
    case aaron     = "com.apple.ttsbundle.siri_male_en-US_compact"
    case fred      = "com.apple.speech.synthesis.voice.Fred"
    case nicky     = "com.apple.ttsbundle.siri_female_en-US_compact"
    case samantha  = "com.apple.ttsbundle.Samantha-compact"
    case tessa     = "com.apple.ttsbundle.Tessa-compact"
    case alex      = "com.apple.speech.voice.Alex"
}

struct K {
    ///Beacon settings
    static var uuid                       = "fda50693-a4e2-4fb1-afcf-c6eb07647825"
    static var beaconID                   = ""
    static var major : CLBeaconMajorValue = 0
    static var minor : CLBeaconMinorValue = 0
    
    ///Default settings
    static var defaultImage               = "Blank"
    static var emptyString                = ""
    
    /// Alerts
    static var ok                         = "OK"
    static var alert                      = "Alert"
    static var locationNeeded             = "Location Services is needed to operate beacon detector."

    ///Test Data for each Exhibit
    static let dictExhibit: [String : (exhibit: String, title: String, image: String, description: String, speach: String)] = [
        "1-1": ("Kai", "David", "Click", "Type: Sculpture\nStyle: Hellenistic\nDate: 2020/7/11","This is the sculpture David, it is made by the student Kai Yan from Beijing university of posts and telecommunications"),
        "1-2": ("Jennifer", "William&Cindy", "Click", "Type: Painting\nStyle: Realism\nDate: 1894/2/01","This is a realistic painting by Jennifer called William and Cindy"),
        "1-3": ("Djedefra", "Sphinx", "Click", "Type: Others\nStyle: N/A\nDate: 2600 B.C.","This is the Egyptian pharaoh Khafre of the fourth dynasty according to the image of the Sphinx built a stone statue, later known as the Sphinx"),
    ]
}

//Struct for exhibits

struct Exhibit: Codable {
    var id: Int
    var name: String
    var date: String
    var voiceDescription: String
    var author: author
    var room: room
    var bluetoothBeacon: bluetoothBeacon
    var type: type
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case room = "room"
        case bluetoothBeacon = "bluetoothBeacon"
        case type = "type"
        case id,name,date,voiceDescription
    }
    

}

struct author: Codable {
    var id: Int?
    var name: String
    var gender: String?
    var birth: String?
    var death: String?
    var country: String?
}

struct room: Codable {
    var id: Int?
    var floor: Int
    var location: Int
}

struct bluetoothBeacon :Codable{
    var id: Int
    var major: Int?
    var minor: Int?
    var uuid: String?
}

struct type: Codable{
    var id: Int?
    var type: String
    var style: String
    var subject: String?
    var material: String?
    var pigment: String?
}

struct user: Codable{

    var id: Int?
    var username: String?
    var password: String?
}

