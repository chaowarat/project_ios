//
//  RootViewController.h
//  CarPrice
//
//  Created by student on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController{
    NSMutableArray *listSmallPrice;
    NSMutableArray *listBigPrice;
}

@property (nonatomic, retain) NSMutableArray *listSmallPrice;
@property (nonatomic, retain) NSMutableArray *listBigPrice;
@end
