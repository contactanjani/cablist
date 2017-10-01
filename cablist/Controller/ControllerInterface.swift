//
//  ControllerInterface.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import CoreLocation

protocol ControllerAndViewInterface {
    
    // Controller <-> View interface
    func getAllTaxisForBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))
    func activeTaxisTapped()
    func InactiveTaxisTapped()
    func viewToggleTapped()
    func mapShownWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))
    func listViewShownWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))
    func mapRegionChangedWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))
    func refreshControlValueChangedWithBound(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))
}

protocol ControllerAndModelLayerInterface {
    
    //MARK:- Controller <-> Model Layer interface
    func finishedFetchingAllTaxis(_ model : TaxiList?)
    func finishedFetchingActiveTaxis(_ model : TaxiList?)
    func finishedFetchingInactiveTaxis(_ model: TaxiList?)
}
