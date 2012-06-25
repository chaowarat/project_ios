//
//  ViewController.m
//  XibFun
//
//  Created by student on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize label, slider, sliderLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    label.text = @"hello";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)doSomething:(id)sender {
    label.text = @"I like chocolate!";
}
- (IBAction)sliderChanged:(id)sender {
    sliderLabel.text = [NSString stringWithFormat:@"%f" ,slider.value];
}

@end
