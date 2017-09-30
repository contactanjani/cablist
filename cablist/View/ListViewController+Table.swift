//
//  ListViewController+table.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import UIKit

extension ListViewController : UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let taxi = taxiList![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:(taxi.state?.rawValue)!)
        if let idLabel = cell?.contentView.viewWithTag(1) as? UILabel {
            idLabel.text = taxi.id?.description
        }
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard taxiList != nil else {return 0}
        return taxiList!.count
    }
}
