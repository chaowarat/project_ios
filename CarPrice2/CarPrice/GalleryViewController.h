//
//  GalleryViewController.h
//  CarPrice
//
//  Created by ccc-mac on 13/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewController : UIViewController{
    NSArray *results;
}

@property(nonatomic, retain) IBOutlet UIScrollView *scrollView;

@end
