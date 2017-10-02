//
//  MainVC+Map.swift
//  cablist
//
//  Created by Anjani on 10/1/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation
import UIKit
import MapKit

//extension for map view
extension MainViewController : MKMapViewDelegate {
    static let kHamburgLatlong = CLLocationCoordinate2DMake(53.5586526, 9.6476378)
    
    func configureMapView() {
        
        mapView = MapViewController.map()
        mapView.delegate = self
        mapView.centerCoordinate = MainViewController.kHamburgLatlong
        self.view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .top, relatedBy: .equal, toItem: self.segmentControlTaxiState, attribute: .bottom, multiplier: 1, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom ,multiplier: 1, constant: 0))
        
    }
    
    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let bounds = getBoundsFromMap(mapView: mapView)
        controller?.mapRegionChangedWithBounds(bounds)
    }
    
    func getBoundsFromMap(mapView : MKMapView) ->(CLLocationCoordinate2D, CLLocationCoordinate2D) {
        let p1 : CLLocationCoordinate2D, p2 : CLLocationCoordinate2D
        p1 = mapView.convert(CGPoint.zero, toCoordinateFrom: mapView)
        
        let bottomRight = CGPoint(x: mapView.frame.size.width, y: mapView.frame.size.width)
        p2 = mapView.convert(bottomRight, toCoordinateFrom: mapView)
    
        return(p1, p2)
    }
    
    func refreshMapWithList(_ list : [Taxi]?) {
        mapView.removeAnnotations(mapView.annotations)
        let annotationList = self.annotationList(list: list)
        mapView.addAnnotations(annotationList)
    }

    func annotationList(list : [Taxi]?) ->[MKPointAnnotation] {
        var annotationList = [MKPointAnnotation]()
        for taxi in list! {
            let coordinate = taxi.coordinate
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate!
            annotation.title = taxi.state?.rawValue
            annotationList.append(annotation)
        }
        return annotationList
    }
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        let identifier = "CustomAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation            
        }
        annotationView!.image = (annotation.title! == State.Active.rawValue) ? UIImage(named: "green_marker") : UIImage(named: "red_marker")
        
        return annotationView
    }
}
