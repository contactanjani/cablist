//
//  Controller.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import CoreLocation

class Controller : ControllerAndViewInterface, ControllerAndModelLayerInterface {
    
    var modelLayer : ModelInterface?
    var view : ViewInterface?
    
    //MARK: Controller <-> View methods
    func getAllTaxisForBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {
        view?.showLoader()
        modelLayer?.getAllTaxisForBounds(bounds)
    }
    
    func activeTaxisTapped() {
        modelLayer?.getActiveTaxis()
    }
    
    func InactiveTaxisTapped() {
        modelLayer?.getInactiveTaxis()
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
    
    func refreshControlValueChangedWithBound(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {
        view?.showStatusBarLoader()
        modelLayer?.getAllTaxisForBounds(bounds)
    }
    
    //MARK: Controller <-> Model Layer Interface
    func finishedFetchingAllTaxis(_ model : TaxiList?) {
        DispatchQueue.main.async {[weak self] in
            var resultList = model?.list
            if  self?.view?.mode() == PageMode.Active {
                resultList = model?.activeTaxis
            }else if self?.view?.mode() == PageMode.Inactive {
                resultList = model?.inactiveTaxis
            }
            self?.view?.updateWithList(resultList)
            self?.view?.updateTaxiCountsInTab(active: (model?.activeTaxis?.count)!, inactive: (model?.inactiveTaxis?.count)!, all: (model?.list?.count)!)
            self?.view?.hideLoader()
        }
    }
    
    func finishedFetchingActiveTaxis(_ model : TaxiList?) {
        view?.updateWithList(model?.activeTaxis)
    }
    
    func finishedFetchingInactiveTaxis(_ model : TaxiList?) {
        view?.updateWithList(model?.inactiveTaxis)
    }
}
