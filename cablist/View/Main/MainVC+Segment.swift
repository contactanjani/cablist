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

extension MainViewController {
    
    func configureSegmentView() {
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.yellow as Any], for: .selected)
    }
    
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
        
        
        DispatchQueue.main.async {[weak self] in
            UIView.transition(with: (self?.segmentControlTaxiState)!,
                              duration: 0.2,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                                self?.segmentControlTaxiState.setTitle(allString, forSegmentAt:0)
                                self?.segmentControlTaxiState.setTitle(activeString, forSegmentAt:1)
                                self?.segmentControlTaxiState.setTitle(inactiveString, forSegmentAt:2)
                }, completion: nil)
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
