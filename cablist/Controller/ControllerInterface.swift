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
    func finishedFetchingAllTaxis(_ model : TaxiList?)
    
    func activeTaxisTapped()
    func finishedFetchingActiveTaxis(_ model : TaxiList?)
    
    func InactiveTaxisTapped()
    func finishedFetchingInactiveTaxis(_ model: TaxiList?)
    
    func viewToggleTapped()
    func mapShownWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))
    func listViewShownWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))
    
    func mapRegionChangedWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) 
}
