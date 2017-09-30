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
    var id : Int?
    var state : State?
    var heading : Float?
    var coordinate : CLLocationCoordinate2D?
    
    init(dictionary : [String : Any]) {
        if let id = dictionary["id"] as? Int {
            self.id = id
        }
        
        if let state = dictionary["state"] as? String {
            self.state = State(rawValue: state)
        }
        
        if let heading = dictionary["heading"] as? Float {
            self.heading = heading
        }
        
        if let coordinateDictionary = dictionary["coordinate"] as? [String : Any] {
            let latitude = coordinateDictionary["latitude"] as? Double
            let longitude = coordinateDictionary["longitude"] as? Double
         
            guard latitude != nil, longitude != nil else {
                return
            }
            self.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        }
    }
}
