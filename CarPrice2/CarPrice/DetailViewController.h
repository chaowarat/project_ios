//
//  DetailViewController.h
//  CarPrice
//
//  Created by student on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"

@interface DetailViewController : UIViewController{
    NSArray *results;
    
    Car *car;
    UILabel *labelManufacture;
    UILabel *labelModel;
    UILabel *labelYear;
    UILabel *labelPrice;
    UILabel *labelAvailable;
    UISegmentedControl *segment;
}

@property (nonatomic, retain) Car *car;
@property (nonatomic, retain) IBOutlet UILabel *labelManufacture;
@property (nonatomic, retain) IBOutlet UILabel *labelModel;
@property (nonatomic, retain) IBOutlet UILabel *labelYear;
@property (nonatomic, retain) IBOutlet UILabel *labelPrice;
@property (nonatomic, retain) IBOutlet UILabel *labelAvailable;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segment;

- (IBAction)touchButton:(id)sender;

@end
