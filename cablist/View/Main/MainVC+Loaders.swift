//
//  MainVC+Loaders.swift
//  cablist
//
//  Created by Anjani on 10/1/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation

//extension for loaders shown during asynchronous operations
extension MainViewController {
    func showLoader() {
        self.showViewLoader()
    }
    
    func hideLoader() {
        self.hideViewLoader()
    }
    
    func showStatusBarLoader(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideStatusBarLoader() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
