//
//  MasterViewController.h
//  PhotoSplitView
//
//  Created by student on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController{
    NSArray *items;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
