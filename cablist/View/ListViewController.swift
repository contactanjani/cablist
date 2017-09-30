//
//  ViewController.swift
//  cablist
//
//  Created by Anjani on 9/29/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import UIKit
import CoreLocation

public class ListViewController: UIViewController, ListViewInterface {

    @IBOutlet weak var tblViewList: UITableView!
    
    var taxiList : [Taxi]?
    
    var controller : ControllerInterface?
    
    class func loadViewController() -> ListViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        return vc
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        controller?.getAllTaxisForBounds(self.getBounds())
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.yellow as Any], for: .selected)

    }

    func getBounds() ->(CLLocationCoordinate2D, CLLocationCoordinate2D) {
        return (CLLocationCoordinate2DMake(53.694865, 9.757589),CLLocationCoordinate2DMake(53.394655, 10.099891))
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateWithList(_ list: [Taxi]?) {
        
        taxiList = list
        
        DispatchQueue.main.async {[weak self] in
            self?.tblViewList.reloadData()
        }
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
}

