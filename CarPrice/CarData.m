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
    car.manufacture = @"Suzuki";
    car.model = @"Switt 1.0 L";
    car.year = @"2012";
    car.price = @"300000";
    car.available = @"1 Month wait";
    car.option = @"New test";
    
    NSMutableArray *list = [[NSMutableArray alloc] initWithCapacity:20];
    [list addObject:car];
    
    return  list;
}

+ (NSMutableArray *) bigPrice{
    Car *car = [[Car alloc] init];
    car.manufacture = @"Toyota";
    car.model = @"Vios 1.5 L";
    car.year = @"2000";
    car.price = @"800000";
    car.available = @"2 Month wait";
    car.option = nil;
    
    NSMutableArray *list = [[NSMutableArray alloc] initWithCapacity:20];
    [list addObject:car];
    
    return  list;
}

@end
