//
//  ListViewInterface.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation

protocol  ViewInterface {
    func updateWithList(_ list : [Taxi]?)
    func updateTaxiCountsInTab(active : Int, inactive : Int, all : Int)
    
    func toggleView()
    func mode()->PageMode
    
    func showLoader()
    func hideLoader()
    
    func showStatusBarLoader()
    func hideStatusBarLoader()
    
    func showAlertWithMessage(_ msg : String)
}
