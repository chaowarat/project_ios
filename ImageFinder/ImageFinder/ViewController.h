//
//  ViewController.h
//  ImageFinder
//
//  Created by student on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>{
    NSArray *result;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;

@end
