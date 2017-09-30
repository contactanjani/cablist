//
//  Service.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import CoreLocation

class Service : ModelInterface {
    
    var controller : ControllerInterface?
    var taxiList : TaxiList?
    
    init () {}
    
    func getAllTaxisForBounds(bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {
        
        let urlString = "https://poi-api.mytaxi.com/PoiService/poi/v1?p2Lat=\(bounds.1.latitude.description)&p1Lon=\(bounds.0.longitude.description)&p1Lat=\(bounds.0.latitude.description)&p2Lon=\(bounds.1.longitude.description)"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        NetworkManager.shared.fireRequest(request) {[weak self] (dictionary) in
            guard dictionary != nil else {
                self?.controller?.finishedFetchingTaxis(nil, forBounds: bounds)
                return
            }
            var taxiList = [Taxi]()
            
            if let poiList = dictionary!["poiList"] as? [[String:Any]] {
                for poi in poiList {
                    let taxi = Taxi(dictionary: poi)
                    taxiList.append(taxi)
                }
            }
            
            self?.taxiList = TaxiList()
            self?.taxiList?.list = taxiList
            
            self?.controller?.finishedFetchingTaxis(self?.taxiList!.list, forBounds: bounds)
        }
    }
    
    func getActiveTaxis() {
        let activeTaxis = self.taxiList?.activeTaxis
        controller?.finishedFetchingActiveTaxis(activeTaxis)
    }
    
    func getInactiveTaxis() {
        let inactiveTaxis = self.taxiList?.inactiveTaxis
        controller?.finishedFetchingInactiveTaxis(inactiveTaxis)
    }
}
