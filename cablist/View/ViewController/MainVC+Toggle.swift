//
//  MainVC+Toggle.swift
//  cablist
//
//  Created by Anjani on 10/1/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import UIKit

//extension for map/list button at the top right (Toggle)
extension MainViewController {
    
    static let kToggleTitleMap = "Map"
    static let kToggleTitleList = "List"
    
    //MARK:- ACTIONS
    @IBAction func btnMapTapped(_ sender: Any) {
        controller?.viewToggleTapped()
    }
    
    func toggleView() {
        var alphaTableView = CGFloat(0)
        var alphaMapView = CGFloat(1)
        var flipView : UIView = self.tblViewList
        var btnToggleTitle = MainViewController.kToggleTitleList
        
        if isMapShown == true {
            alphaTableView = CGFloat(1)
            alphaMapView = CGFloat(0)
            flipView = self.mapView
            btnToggleTitle = MainViewController.kToggleTitleMap
        }
        
        UIView.transition(with: flipView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            self.tblViewList.alpha = alphaTableView
            self.mapView.alpha = alphaMapView

        }) { (val) in
            self.isMapShown = self.mapView.alpha == 1
            self.isMapShown ? self.controller?.mapShownWithBounds(self.getBounds()) : self.controller?.listViewShownWithBounds(self.getBounds())
            self.btnToggleView.title = btnToggleTitle
        }
    }
}
