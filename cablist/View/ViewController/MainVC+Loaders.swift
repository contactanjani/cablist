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
    
    func showAlertWithMessage(_ msg : String) {
        DispatchQueue.main.async {[weak self] in
            self?.hideLoader()
            self?.hideStatusBarLoader()
            let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            self?.navigationController?.present(alert, animated: true, completion: nil)
        }
    }
}
