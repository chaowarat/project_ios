//
//  FirstViewController.h
//  CarPrice
//
//  Created by student on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController{
    NSArray *results;
    NSMutableArray *listSmallPrice;
    NSMutableArray *listBigPrice;
}

-(IBAction)carPriceTouch:(id)sender;
-(IBAction)galleryTouch:(id)sender;

@end
