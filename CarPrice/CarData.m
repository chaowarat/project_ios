//
//  CarData.m
//  CarPrice
//
//  Created by student on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CarData.h"
#import "Car.h"

@implementation CarData

+ (NSMutableArray *) smallPrice{
    Car *car = [[Car alloc] init];
    car.name = @"Suzuki Switt 1.0 L";
    car.price = @"300000";
    car.option = nil;
    
    NSMutableArray *list = [[NSMutableArray alloc] initWithCapacity:20];
    [list addObject:car];
    
    return  list;
}

+ (NSMutableArray *) bigPrice{
    Car *car = [[Car alloc] init];
    car.name = @"Toyota Vios 1.5 L";
    car.price = @"800000";
    car.option = nil;
    
    NSMutableArray *list = [[NSMutableArray alloc] initWithCapacity:20];
    [list addObject:car];
    
    return  list;
}

@end
