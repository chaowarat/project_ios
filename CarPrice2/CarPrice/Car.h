//
//  Car.h
//  CarPrice
//
//  Created by student on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject {
    NSString *manufacture;
    NSString *model;
    NSString *year;
    NSString *price;
    NSString *available;
    NSString *image;    
}

@property (nonatomic, retain) NSString *manufacture;
@property (nonatomic, retain) NSString *model;
@property (nonatomic, retain) NSString *year;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *available;
@property (nonatomic, retain) NSString *image;

@end
