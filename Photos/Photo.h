//
//  Photo.h
//  Photos
//
//  Created by Antony Harfield on 01/09/2011.
//  Copyright 2011 Antony Harfield. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Photo : NSObject <MKAnnotation> {
    
    NSString *title;
    NSString *imageName;
    CLLocationCoordinate2D coordinate;
    
}

@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *imageName;
@property(nonatomic,assign) CLLocationCoordinate2D coordinate;


@end
