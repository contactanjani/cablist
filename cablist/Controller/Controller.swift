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
    var view : ViewInterface?
    
    func getAllTaxisForBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {
        view?.showLoader()
        modelLayer?.getAllTaxisForBounds(bounds)
    }
    
    func finishedFetchingAllTaxis(_ model : TaxiList?) {
        
        var resultList = model?.list
        if  view?.mode() == PageMode.Active {
            resultList = model?.activeTaxis
        }else if view?.mode() == PageMode.Inactive {
            resultList = model?.inactiveTaxis
        }
        view?.updateWithList(resultList)
        view?.updateTaxiCountsInTab(active: (model?.activeTaxis?.count)!, inactive: (model?.inactiveTaxis?.count)!, all: (model?.list?.count)!)
        view?.hideLoader()
    }
    
    func activeTaxisTapped() {
        modelLayer?.getActiveTaxis()
    }
    func finishedFetchingActiveTaxis(_ model : TaxiList?) {
        view?.updateWithList(model?.activeTaxis)
    }
    
    func InactiveTaxisTapped() {
        modelLayer?.getInactiveTaxis()
    }
    func finishedFetchingInactiveTaxis(_ model : TaxiList?) {
        view?.updateWithList(model?.inactiveTaxis)

    }
    
    func viewToggleTapped(){
        view?.toggleView()
    }
    
    func mapShownWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))  {
        view?.showLoader()
        modelLayer?.getAllTaxisForBounds(bounds)
    }
    
    func listViewShownWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))  {
        view?.showLoader()
        modelLayer?.getAllTaxisForBounds(bounds)
    }
    
    func mapRegionChangedWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D))  {
        view?.showStatusBarLoader()
        modelLayer?.getAllTaxisForBounds(bounds)
    }
}
