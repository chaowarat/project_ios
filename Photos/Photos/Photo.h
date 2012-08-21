//
//  Photo.h
//  Photos
//
//  Created by student on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapkit/Mapkit.h>

@interface Photo : NSObject{
    
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
