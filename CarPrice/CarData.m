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
    NSMutableArray *list = [[NSMutableArray alloc] initWithCapacity:20];
    
    Car *car1 = [[Car alloc] init];
    car1.manufacture = @"Suzuki";
    car1.model = @"Swift GA";
    car1.year = @"2012";
    car1.price = @"469000";
    car1.available = @"Today";
    car1.option = @"*New*";
    [list addObject:car1];
    
    Car *car2 = [[Car alloc] init];
    car2.manufacture = @"Toyota";
    car2.model = @"Vigo";
    car2.year = @"2010";
    car2.price = @"492000";
    car2.available = @"1 Year ago";
    car2.option = nil;
    [list addObject:car2];
    
    Car *car3 = [[Car alloc] init];
    car3.manufacture = @"Nissan";
    car3.model = @"Almera 1.2 S MT";
    car3.year = @"2012";
    car3.price = @"429000";
    car3.available = @"Today";
    car3.option = @"*New*";
    [list addObject:car3];
    
    Car *car4 = [[Car alloc] init];
    car4.manufacture = @"Honda";
    car4.model = @"Brio V MT";
    car4.year = @"2012";
    car4.price = @"469500";
    car4.available = @"Today";
    car4.option = @"*New*";
    [list addObject:car4];
    
    Car *car5 = [[Car alloc] init];
    car5.manufacture = @"Honda";
    car5.model = @"Brio S MT";
    car5.year = @"2012";
    car5.price = @"399900";
    car5.available = @"Today";
    car5.option = @"*New*";
    [list addObject:car5];
    
    return  list;
}

+ (NSMutableArray *) bigPrice{
    NSMutableArray *list = [[NSMutableArray alloc] initWithCapacity:20];
    
    Car *car1 = [[Car alloc] init];
    car1.manufacture = @"Toyota";
    car1.model = @"Vios 1.5 L";
    car1.year = @"2000";
    car1.price = @"800000";
    car1.available = @"2 Month wait";
    car1.option = nil;
    [list addObject:car1];
    
    Car *car2 = [[Car alloc] init];
    car2.manufacture = @"Toyota";
    car2.model = @"Prius C";
    car2.year = @"2012";
    car2.price = @"1390000";
    car2.available = @"Today";
    car2.option = @"*New*";
    [list addObject:car2];
    
    Car *car3 = [[Car alloc] init];
    car3.manufacture = @"Toyota";
    car3.model = @"Camry";
    car3.year = @"2012";
    car3.price = @"1299000";
    car3.available = @"Today";
    car3.option = @"*New*";
    [list addObject:car3];
    
    Car *car4 = [[Car alloc] init];
    car4.manufacture = @"Nissan";
    car4.model = @"1.2 VL CVT";
    car4.year = @"2012";
    car4.price = @"599000";
    car4.available = @"Today";
    car4.option = @"*New*";
    [list addObject:car4];
    
    Car *car5 = [[Car alloc] init];
    car5.manufacture = @"Honda";
    car5.model = @"Jazz S MT";
    car5.year = @"2012";
    car5.price = @"590000";
    car5.available = @"Today";
    car5.option = @"*New*";
    [list addObject:car5];
    
    Car *car6 = [[Car alloc] init];
    car6.manufacture = @"BMW";
    car6.model = @"M3 2013";
    car6.year = @"2013";
    car6.price = @"2131250";
    car6.available = @"Next Yeay";
    car6.option = nil;
    [list addObject:car6];
    
    Car *car7 = [[Car alloc] init];
    car7.manufacture = @"BMW";
    car7.model = @"M3 2011";
    car7.year = @"2011";
    car7.price = @"1732900";
    car7.available = @"Last Year";
    car7.option = nil;
    [list addObject:car7];
    
    
    return  list;
}

@end
