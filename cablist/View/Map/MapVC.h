//
//  MapVC.h
//  cablist
//
//  Created by Anjani on 10/1/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

+(MKMapView*)map;

@end
