//
//  Taxi.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import CoreLocation

enum State : String {
    case Active = "ACTIVE"
    case Inactive = "INACTIVE"
}

class Taxi {
    
    static let kId = "id"
    static let kState = "state"
    static let kHeading = "heading"
    static let kCoordinate = "coordinate"
    static let kLatitude = "latitude"
    static let kLongitude = "longitude"
    
    var id : Int?
    var state : State?
    var heading : Float?
    var coordinate : CLLocationCoordinate2D?
    
    init(dictionary : [String : Any]) {
        if let id = dictionary[Taxi.kId] as? Int {
            self.id = id
        }
        
        if let state = dictionary[Taxi.kState] as? String {
            self.state = State(rawValue: state)
        }
        
        if let heading = dictionary[Taxi.kHeading] as? Float {
            self.heading = heading
        }
        
        if let coordinateDictionary = dictionary[Taxi.kCoordinate] as? [String : Any] {
            let latitude = coordinateDictionary[Taxi.kLatitude] as? Double
            let longitude = coordinateDictionary[Taxi.kLongitude] as? Double
         
            guard latitude != nil, longitude != nil else {
                return
            }
            self.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        }
    }
}
