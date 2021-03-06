//
//  ListViewController+Segment.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import UIKit

enum PageMode {
    case All
    case Active
    case Inactive
}

//extension for segment control (Active, Inactive, All) Tab
extension MainViewController {
    
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        let segmentControl = sender as! UISegmentedControl
        let index = segmentControl.selectedSegmentIndex
        
        switch index {
        case 0 : controller?.getAllTaxisForBounds(self.getBounds())
        case 1 : controller?.activeTaxisTapped()
        case 2 : controller?.InactiveTaxisTapped()
        default : break
        }
    }
    
    func updateTaxiCountsInTab(active : Int, inactive : Int, all : Int) {
        let allString = "All(\(all))"
        let activeString = "Active(\(active))"
        let inactiveString = "Inactive(\(inactive))"
        
        let currentAllString = self.segmentControlTaxiState.titleForSegment(at: 0)
        let currentActiveString = self.segmentControlTaxiState.titleForSegment(at: 1)
        let currentInActiveString = self.segmentControlTaxiState.titleForSegment(at: 2)
        
        guard  currentAllString != allString || currentActiveString != activeString || currentInActiveString != inactiveString else {
            return
        }
        
        DispatchQueue.main.async {[weak self] in
                                self?.segmentControlTaxiState.setTitle(allString, forSegmentAt:0)
                                self?.segmentControlTaxiState.setTitle(activeString, forSegmentAt:1)
                                self?.segmentControlTaxiState.setTitle(inactiveString, forSegmentAt:2)
        }
    }
    
    func mode() ->PageMode {
        let index = segmentControlTaxiState.selectedSegmentIndex
        switch index {
        case 0 : return PageMode.All
        case 1 : return PageMode.Active
        case 2 : return PageMode.Inactive
        default : break
        }
        return PageMode.All
    }
}
