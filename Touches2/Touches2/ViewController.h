//
//  ViewController.h
//  Touches2
//
//  Created by student on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
}

-(IBAction)handlePan:(UIPanGestureRecognizer *)recogizer;
-(IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;
-(IBAction)handleRotation:(UIRotationGestureRecognizer *)recognizer;

@end
