//
//  PhotoViewController.h
//  CarPrice
//
//  Created by ccc-mac on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"

@interface PhotoViewController : UIViewController{
    UISegmentedControl *segment;
    UIImageView *imageView;
    Car *car;
}

@property (nonatomic, retain) IBOutlet UISegmentedControl *segment;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) Car *car;

- (IBAction)touchButton:(id)sender;

@end
