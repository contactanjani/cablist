//
//  UIViewController+Loader.swift
//  cablist
//
//  Created by Anjani on 10/1/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import UIKit

var LMSToastActivityView: UnsafePointer<UIView>? = nil

extension UIViewController {
    func showViewLoader(_ disableAll:Bool = false) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            self.view.showActivityIndicatorView(disableAll)
        }
    }
    
    func hideViewLoader() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.view.hideActivityIndicatorView()
        }
    }
}

extension UIView {
    
    func showActivityIndicatorView(_ disableAll: Bool = false) {
        
        let existingView = objc_getAssociatedObject(self, &LMSToastActivityView) as! UIView?
        if(existingView != nil) {
            return
        }
        
        let disablerView = UIView();
        disablerView.translatesAutoresizingMaskIntoConstraints = false
        disablerView.backgroundColor = UIColor.clear //UIColor(white: 0.0, alpha: 0.3)
        disablerView.alpha = 0.0
        
        if disableAll == true {
            
            let window = (UIApplication.shared.delegate as! AppDelegate).window!
            window.addSubview(disablerView)
            
        } else {
            self.addSubview(disablerView)
        }
        
        var viewsDictionary: NSDictionary = ["disablerView": disablerView]
        
        let contraintArrayv  = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[disablerView]-0-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: viewsDictionary as! [String : AnyObject])
        let contraintArrayh = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[disablerView]-0-|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: viewsDictionary as! [String : AnyObject])
        
        if disableAll == true {
            
            let window = (UIApplication.shared.delegate as! AppDelegate).window!
            window.addConstraints(contraintArrayv)
            window.addConstraints(contraintArrayh)
            
        } else {
            
            self.addConstraints(contraintArrayv)
            self.addConstraints(contraintArrayh)
        }
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
        let bgView = UIVisualEffectView(effect: blurEffect)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.layer.cornerRadius = 8;
        bgView.layer.masksToBounds = true
        bgView.layer.shadowColor = UIColor.clear.cgColor
        bgView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        bgView.layer.shadowOpacity = 0.8
        bgView.layer.shadowRadius = 6;
        bgView.layer.shadowOffset = CGSize(width: 4, height: 4)
        bgView.layer.shouldRasterize = true
        bgView.layer.rasterizationScale = UIScreen.main.scale
        disablerView.addSubview(bgView)
        
        viewsDictionary = ["bgView": bgView]
        
        let constaintBgViewV = NSLayoutConstraint.constraints(withVisualFormat: "V:[bgView(100)]", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: viewsDictionary as! [String : AnyObject])
        let constaintBgViewH = NSLayoutConstraint.constraints(withVisualFormat: "H:[bgView(100)]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: viewsDictionary as! [String : AnyObject])
        
        bgView.addConstraints(constaintBgViewV)
        bgView.addConstraints(constaintBgViewH)
        
        let centerBgViewx =  NSLayoutConstraint(item: bgView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: disablerView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let centerBgViewy =  NSLayoutConstraint(item: bgView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: disablerView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        
        disablerView.addConstraint(centerBgViewx)
        disablerView.addConstraint(centerBgViewy)
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white);
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = UIColor.gray
        activity.backgroundColor = UIColor.clear
        disablerView.addSubview(activity);
        activity.startAnimating()
        
        let centerActivtyx =  NSLayoutConstraint(item: activity, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: disablerView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let centerActivtyy =  NSLayoutConstraint(item: activity, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: disablerView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        
        disablerView.addConstraint(centerActivtyx)
        disablerView.addConstraint(centerActivtyy)
        
        // associate the activity view with self
        objc_setAssociatedObject (self, &LMSToastActivityView, disablerView, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        self.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.2, animations: {
            disablerView.alpha = 1.0
        })
        
    }
    
    func hideActivityIndicatorView() {
        let existingView = objc_getAssociatedObject(self, &LMSToastActivityView) as! UIView?
        if(existingView != nil) {
            self.isUserInteractionEnabled = true
            UIView.animate(withDuration: 0.2, animations: {
                existingView!.alpha = 0.0
            }, completion: { success in
                existingView!.removeFromSuperview()
                objc_setAssociatedObject (self, &LMSToastActivityView, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            })
        }
        
    }
}

