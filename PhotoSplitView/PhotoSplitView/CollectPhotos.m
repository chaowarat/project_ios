//
//  CollectPhotos.m
//  Photos
//
//  Created by Antony Harfield on 01/09/2011.
//  Copyright 2011 Antony Harfield. All rights reserved.
//

#import "CollectPhotos.h"
#import "Photo.h"

@implementation CollectPhotos

+ (NSArray *)photos {
    
    Photo *p1 = [[Photo alloc] init];
    p1.title = @"Cambridge, England";
    p1.imageName = @"cambridge.jpg";

    Photo *p2 = [[Photo alloc] init];
    p2.title = @"Aix-en-Provence, France";
    p2.imageName = @"aix.jpg";

    Photo *p3 = [[Photo alloc] init];
    p3.title = @"Sukhothai, Thailand";
    p3.imageName = @"sukhothai.jpg";

    Photo *p4 = [[Photo alloc] init];
    p4.title = @"Koli, Finland";
    p4.imageName = @"koli.jpg";

    Photo *p5 = [[Photo alloc] init];
    p5.title = @"Santa Monica, USA";
    p5.imageName = @"santa-monica.jpg";
    
    Photo *p6 = [[Photo alloc] init];
    p6.title = @"Kuala Lumpur, Malaysia";
    p6.imageName = @"petronas-twin-towers.jpg";
    
    Photo *p7 = [[Photo alloc] init];
    p7.title = @"Barcelona, Spain";
    p7.imageName = @"barcelona.jpg";
    
    Photo *p8 = [[Photo alloc] init];
    p8.title = @"New York, USA";
    p8.imageName = @"new-york.jpg";
    
    return [[NSArray alloc] initWithObjects:p1, p2, p3, p4, p5, p6, p7, p8, nil];
}

@end
