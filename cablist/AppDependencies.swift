//
//  AppDependencies.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    class func initializeDependencies(window : UIWindow) -> UIViewController {
        
        let controller = Controller()
        let view = ListViewController.loadViewController()
        let modelLayer = Service()
        
        //linking view and controller
        view.controller = controller
        controller.view = view
        
        //linking controller and model layer
        controller.modelLayer = modelLayer
        modelLayer.controller = controller
        
        return view
    }
}
