//
//  DetailViewController.h
//  Contacts2
//
//  Created by student on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    UIImageView *imageView;
    NSString *imageURL;
    NSDictionary *item;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) NSDictionary *item;

@end
