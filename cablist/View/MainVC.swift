//
//  ViewController.swift
//  cablist
//
//  Created by Anjani on 9/29/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


public class MainViewController: UIViewController, ViewInterface {
    
    //MARK:- Constants
    static let kDefaultBounds = (CLLocationCoordinate2DMake(53.694865, 9.757589),CLLocationCoordinate2DMake(53.394655, 10.099891))
    static let kStoryBoardIdentifier = "Main"
    static let kMainViewControllerIdentifier = "MainViewController"

    //MARK:- IBOutlets
    @IBOutlet weak var segmentControlTaxiState: UISegmentedControl!
    @IBOutlet weak var btnToggleView: UIBarButtonItem!
    
    //MARK:- local variables
    var tblViewList: UITableView!
    var mapView: MKMapView!
    var taxiList : [Taxi]?
    var controller : ControllerAndViewInterface?
    var isMapShown = false
    
    class func loadViewController() -> MainViewController {
        let storyboard = UIStoryboard(name: kStoryBoardIdentifier, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: kMainViewControllerIdentifier) as! MainViewController
        return vc
    }
    
    //MARK:- LIFECYCLE METHODS
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        self.configure()
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configure() {
        configureUI()
        configureData()
    }
    
    //MARK:- CONFIGURE SEGMENT, TABLE, MAP
    func configureUI() {
        configureMapView()
        configureTableView()
    }
    
    func configureData() {
        controller?.getAllTaxisForBounds(self.getBounds())
    }

    //MARK:- INPUT
    func getBounds() ->(CLLocationCoordinate2D, CLLocationCoordinate2D) {
        
        if self.isMapShown == false {
            return MainViewController.kDefaultBounds
        }else {
            return getBoundsFromMap(mapView: self.mapView)
        }
    }

    //MARK:- UPDATE UI METHODS
    func updateWithList(_ list: [Taxi]?) {
        taxiList = list
        DispatchQueue.main.async {[weak self] in
            
            if self?.isMapShown == false {
                self?.tblViewList.reloadData()
                self?.tblViewList.refreshControl?.endRefreshing()
            }else {
                self?.refreshMapWithList(self?.taxiList)
            }
        }
    }
}

