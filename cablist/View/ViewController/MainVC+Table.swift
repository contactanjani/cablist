//
//  ListViewController+table.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import UIKit

//extension for table view
extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    
    static let kCellIdentifier = "taxi"
    
    func configureTableView() {
        tblViewList = ListViewController.table()
        tblViewList.dataSource = self
        tblViewList.delegate = self
        var frame = tblViewList.frame
        frame.origin.y = segmentControlTaxiState.frame.origin.y + segmentControlTaxiState.frame.size.height + 19
        frame.origin.x = 0
        frame.size.width = self.view.frame.size.width
        frame.size.height = self.view.frame.size.height - frame.origin.y
        tblViewList.frame = frame
        self.view.addSubview(tblViewList)
    
        self.addRefreshControl()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taxi = taxiList![indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier:MainViewController.kCellIdentifier) as? ListViewCell {
            cell.updateWithObject(taxi)
            return cell
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard taxiList != nil else {return 0}
        return taxiList!.count
    }
    
    func addRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(MainViewController.refreshControlActionEnded),
                                 for: .valueChanged)
        tblViewList.refreshControl = refreshControl
    }
    
    @objc func refreshControlActionEnded() {
        controller?.refreshControlValueChangedWithBound(self.getBounds())
    }
}
