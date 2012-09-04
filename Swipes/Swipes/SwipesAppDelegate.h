//
//  SwipesAppDelegate.h
//  Swipes
//
//  Created by Antony Harfield on 13/09/2011.
//  Copyright 2011 Antony Harfield. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwipesViewController;

@interface SwipesAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SwipesViewController *viewController;

@end
