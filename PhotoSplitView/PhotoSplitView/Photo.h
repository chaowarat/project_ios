//
//  Photo.h
//  Photos
//
//  Created by Antony Harfield on 01/09/2011.
//  Copyright 2011 Antony Harfield. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject {
    
    NSString *title;
    NSString *imageName;
    
}

@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *imageName;

@end
