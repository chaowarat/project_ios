//
//  ViewController.m
//  Touches
//
//  Created by student on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(tap:)];
    tapRecognizer.numberOfTapsRequired = 3;
    [self.view addGestureRecognizer:tapRecognizer];
    [tapRecognizer release];
    
    UISwipeGestureRecognizer *swipeRightRecognizer =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(swipeRight:)];
    swipeRightRecognizer.direction =
    UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRightRecognizer];
    [swipeRightRecognizer release];
    UISwipeGestureRecognizer *swipeLeftRecognizer =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(swipeLeft:)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeftRecognizer];
    [swipeLeftRecognizer release];
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

- (void)tap:(UIGestureRecognizer *)recognizer {
    NSLog(@"3 taps!");
    // Show the monster
}

- (void)swipeRight:(UIGestureRecognizer *)recognizer {
    NSLog(@"Right");
}
- (void)swipeLeft:(UIGestureRecognizer *)recognizer {
    NSLog(@"Left");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSUInteger numTouches = [touches count];
    NSUInteger numTaps = [[touches anyObject] tapCount];
    NSLog(@"touchesBegan... Touches: %d  Taps: %d", numTouches, numTaps);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved...");
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded...");
}

@end
