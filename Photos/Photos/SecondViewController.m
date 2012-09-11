//
//  SecondViewController.m
//  Photos
//
//  Created by student on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "DetailViewController.h"
#import "CollectPhotos.h"
#import "Photo.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Map", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"07-map-marker.png"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *photos = [CollectPhotos photos];
    [mapView addAnnotations:photos];

}

- (MKAnnotationView *)mapView:(MKMapView *)mv viewForAnnotation:(id<MKAnnotation>)annotation{
    MKPinAnnotationView* pinView = (MKPinAnnotationView *) [mv dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
    if(!pinView){
        pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"] autorelease];
        
        pinView.pinColor = MKPinAnnotationColorRed;
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;
        
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
        pinView.rightCalloutAccessoryView = rightButton;
    }
    else {
        pinView.annotation = annotation;
    }
    
    return pinView;
}

-(void)showDetails:(id)sender{
    NSLog(@"Showing details...");
    
    Photo *photo = [[mapView selectedAnnotations] objectAtIndex:0];
    DetailViewController *detailController = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:detailController animated:YES];
    
    detailController.label.text = photo.title;
    detailController.imageView.image = [UIImage imageNamed:photo.imageName];
    [detailController release];
    
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
