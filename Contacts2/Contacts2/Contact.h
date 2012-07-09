//
//  Contact.h
//  Contacts2
//
//  Created by student on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
