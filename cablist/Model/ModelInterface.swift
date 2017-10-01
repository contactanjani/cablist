//
//  ModelInterface.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import CoreLocation

protocol ModelInterface {
    func getAllTaxisForBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))
    func getActiveTaxis()
    func getInactiveTaxis()
    
}
