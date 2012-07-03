//
//  Contact.h
//  Contacts
//
//  Created by Antony Harfield on 11/08/2011.
//

#import <Foundation/Foundation.h>


@interface Contact : NSObject {
    
    NSString *firstName;
    NSString *lastName;
    NSString *phone;
    NSString *email;
    
}

@property(nonatomic,retain) NSString *firstName;
@property(nonatomic,retain) NSString *lastName;
@property(nonatomic,retain) NSString *phone;
@property(nonatomic,retain) NSString *email;

@end
