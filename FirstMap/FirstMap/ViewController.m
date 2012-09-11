//
//  ViewController.m
//  FirstMap
//
//  Created by student on 8/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	CLLocationCoordinate2D center = CLLocationCoordinate2DMake(16.744551, 100.194368);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 1500, 1500);
    [mapView setRegion:region];
    
    //create a building
    Building *building1 = [[Building alloc] init];
    building1.title = @"CSIT";
    building1.subtitle = @"Faculty of Science";
    building1.coordinate = CLLocationCoordinate2DMake(16.742167, 100.193349);
    
    [mapView addAnnotation:building1];
    
    //create a building
    Building *building2 = [[Building alloc] init];
    building2.title = @"No name 1";
    building2.subtitle = @"Faculty of No name 1";
    building2.coordinate = CLLocationCoordinate2DMake(16.747267, 100.193349);
    
    [mapView addAnnotation:building2];
    
    //create a building
    Building *building3 = [[Building alloc] init];
    building3.title = @"No name 2";
    building3.subtitle = @"Faculty of No name 2";
    building3.coordinate = CLLocationCoordinate2DMake(16.742267, 100.198249);
    
    [mapView addAnnotation:building3];
}

- (IBAction)changeRegion:(id)sender{
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(16.734551, 100.194368);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 1500, 1500);
    [mapView setRegion:region animated:YES];
}

- (IBAction)mapTypeChanged:(id)sender{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    if(segmentedControl.selectedSegmentIndex == 0){
        self.mapView.mapType = MKMapTypeStandard;
    }
    else if(segmentedControl.selectedSegmentIndex == 1){
        self.mapView.mapType = MKMapTypeSatellite;
    }
    else {
        self.mapView.mapType = MKMapTypeHybrid;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
