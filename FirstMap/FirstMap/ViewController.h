//
//  ViewController.h
//  FirstMap
//
//  Created by student on 8/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/Mapkit.h>
#import "Building.h"

@interface ViewController : UIViewController{
    MKMapView *mapView;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

- (IBAction)changeRegion:(id)sender;
- (IBAction)mapTypeChanged:(id)sender;

@end
