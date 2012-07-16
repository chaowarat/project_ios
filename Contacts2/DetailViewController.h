//
//  DetailViewController.h
//  Contacts2
//
//  Created by student on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface DetailViewController : UIViewController{
    Contact *contact;
    UILabel *label;
    UILabel *labelEmail;
    UIImageView *imageView;
}

@property (nonatomic, retain) Contact *contact;
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UILabel *labelEmail;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@end
