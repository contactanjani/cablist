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
    static let kPOIBaseUrl = "https://poi-api.mytaxi.com/PoiService/poi/v1?"

    var controller : ControllerAndModelLayerInterface?
    var taxiList : TaxiList?
    
    init () {}
    
    func getAllTaxisForBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {
        
        let urlString = Service.kPOIBaseUrl + "p2Lat=\(bounds.1.latitude.description)&p1Lon=\(bounds.0.longitude.description)&p1Lat=\(bounds.0.latitude.description)&p2Lon=\(bounds.1.longitude.description)"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        NetworkManager.shared.fireRequest(request) {[weak self] (dictionary) in
            guard dictionary != nil else {
                self?.controller?.finishedFetchingAllTaxis(nil)
                return
            }
            self?.taxiList = TaxiList(dictionary : dictionary!)
            self?.controller?.finishedFetchingAllTaxis(self?.taxiList)
        }
    }
    
    func getActiveTaxis() {
        controller?.finishedFetchingActiveTaxis(self.taxiList)
    }
    
    func getInactiveTaxis() {
        controller?.finishedFetchingInactiveTaxis(self.taxiList)
    }
}
