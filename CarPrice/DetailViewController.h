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
    Car *car;
}

@property (nonatomic, retain) Car *car;

@end
