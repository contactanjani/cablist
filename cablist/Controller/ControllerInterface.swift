//
//  ControllerInterface.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import CoreLocation

protocol ControllerInterface {
    func getAllTaxisForBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))
    func finishedFetchingTaxis(_ list : [Taxi]?, forBounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))
    
    func activeTaxisTapped()
    func finishedFetchingActiveTaxis(_ list: [Taxi]?)
    
    func InactiveTaxisTapped()
    func finishedFetchingInactiveTaxis(_ list: [Taxi]?)
}
