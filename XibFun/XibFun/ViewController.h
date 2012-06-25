//
//  ViewController.h
//  XibFun
//
//  Created by student on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UILabel *label;
    UILabel *sliderLabel;
    UISlider *slider;
}

@property(nonatomic, retain) IBOutlet UILabel *label;
@property(nonatomic, retain) IBOutlet UILabel *sliderLabel;
@property(nonatomic, retain) IBOutlet UISlider *slider;

- (IBAction)doSomething:(id)sender;
- (IBAction)sliderChanged:(id)sender;

@end
