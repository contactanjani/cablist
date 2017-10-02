//
//  MapVC.m
//  cablist
//
//  Created by Anjani on 10/1/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapVC.h"
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface MapViewController ()
@property (retain, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

+(MapViewController*)loadViewController
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MapViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MapViewController"];
    return vc;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(MKMapView*)map
{
    MapViewController *mapVC = [MapViewController loadViewController];
    UIView *view = [mapVC view];
    return [mapVC mapView];
}

@end
