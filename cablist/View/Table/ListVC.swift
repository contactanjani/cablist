//
//  TableVC.swift
//  cablist
//
//  Created by Anjani on 10/1/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UITableViewController {
    
    @IBOutlet weak var tblViewList: UITableView!
    
    class func loadViewController() -> ListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        return vc
    }
    
    class func table() ->UITableView {
        let listVC = ListViewController.loadViewController()
        let _ = listVC.view
        return listVC.tblViewList
    }
}
