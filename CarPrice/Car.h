//
//  Car.h
//  CarPrice
//
//  Created by student on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject {
    NSString *name;
    NSString *price;
    NSString *option;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *option;

@end
