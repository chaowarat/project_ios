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
    p1.coordinate = CLLocationCoordinate2DMake(52.201505,0.118918);

    Photo *p2 = [[Photo alloc] init];
    p2.title = @"Aix-en-Provence, France";
    p2.imageName = @"aix.jpg";
    p2.coordinate = CLLocationCoordinate2DMake(43.526242,5.445442);

    Photo *p3 = [[Photo alloc] init];
    p3.title = @"Sukhothai, Thailand";
    p3.imageName = @"sukhothai.jpg";
    p3.coordinate = CLLocationCoordinate2DMake(17.018379,99.704189);

    Photo *p4 = [[Photo alloc] init];
    p4.title = @"Koli, Finland";
    p4.imageName = @"koli.jpg";
    p4.coordinate = CLLocationCoordinate2DMake(63.093088,29.808397);

    return [[NSArray alloc] initWithObjects:p1, p2, p3, p4, nil];
}

@end
