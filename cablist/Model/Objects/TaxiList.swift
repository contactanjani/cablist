//
//  CabList.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation

class TaxiList {
    
    var list : [Taxi]?
    
    init() {}
    init(dictionary : [String:Any]) {
        
        var taxiList = [Taxi]()
        if let poiList = dictionary["poiList"] as? [[String:Any]] {
            for poi in poiList {
                let taxi = Taxi(dictionary: poi)
                taxiList.append(taxi)
            }
        }
        self.list = taxiList
    }
    
    //computed properties are computed only once. fetched from cache later. they don't throw.
    var activeTaxis : [Taxi]? {
        return list?.filter {$0.state == State.Active}
    }
    
    var inactiveTaxis : [Taxi]? {
        return list?.filter {$0.state == State.Inactive}
    }
    
    func taxisByHeadingRange(min : Float = 0, max : Float) -> [Taxi]? {
        return list?.filter{$0.heading! >= min && $0.heading! <= max}
    }
    
    func taxisByLocationName(_ name : String) -> [Taxi]? {
        return nil
    }
}
