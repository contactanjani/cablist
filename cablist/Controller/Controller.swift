//
//  Controller.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import CoreLocation

class Controller : ControllerInterface {
    
    var modelLayer : ModelInterface?
    var view : ListViewInterface?
    
    func getAllTaxisForBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {
        modelLayer?.getAllTaxisForBounds(bounds: bounds)
    }
    
    func finishedFetchingTaxis(_ list: [Taxi]?, forBounds: (CLLocationCoordinate2D, CLLocationCoordinate2D)) {
        view?.updateWithList(list)
    }
    
    func activeTaxisTapped() {
        modelLayer?.getActiveTaxis()
    }
    func finishedFetchingActiveTaxis(_ list: [Taxi]?) {
        view?.updateWithList(list)
    }
    
    func InactiveTaxisTapped() {
        modelLayer?.getInactiveTaxis()
    }
    
    func finishedFetchingInactiveTaxis(_ list: [Taxi]?) {
        view?.updateWithList(list)
    }
}
