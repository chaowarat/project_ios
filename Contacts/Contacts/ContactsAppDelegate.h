//
//  ContactsAppDelegate.h
//  Contacts
//
//  Created by Antony Harfield on 11/08/2011.
//

#import <UIKit/UIKit.h>

@class ContactsViewController;

@interface ContactsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ContactsViewController *viewController;

@end
