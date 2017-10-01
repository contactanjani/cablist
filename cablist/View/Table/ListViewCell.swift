//
//  ListViewCell.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import UIKit

private let kInactiveColor = UIColor(red:236/255, green:115/255, blue: 75/255, alpha: 1)
private let kActiveColor = UIColor(red: 2/255, green: 215/255, blue: 73/255, alpha: 1)

class ListViewCell : UITableViewCell {
    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var imgViewLocation: UIImageView!
    
    var taxi : Taxi?
    
    func updateWithObject(_ taxi : Taxi) {
        self.taxi = taxi
        self.prepareForReuse()
        self.updateView()
    }
    
    private func updateView() {
        lblID.text = String(format:"%d",(self.taxi?.id)!)
        lblState.text = String(format:"  %@  ",(self.taxi?.state?.rawValue)!)
        lblLocation.text = String(format:"%f, %f",(self.taxi?.coordinate?.latitude)!, (self.taxi?.coordinate?.longitude)!)
        lblHeading.text = String(format:"%f",(self.taxi?.heading)!)
        
        self.updateCellBasedOnStatus()
    }
    
    private func updateCellBasedOnStatus() {
        if self.taxi?.state! == State.Active {
            lblState.backgroundColor = kActiveColor
            imgViewLocation.image = UIImage(named:"green_loc")
        }else {
            lblState.backgroundColor = kInactiveColor
            imgViewLocation.image = UIImage(named:"red_loc")
        }
    }
}
