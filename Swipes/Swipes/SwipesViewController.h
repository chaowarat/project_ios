//
//  SwipesViewController.h
//  Swipes
//
//  Created by Antony Harfield on 13/09/2011.
//  Copyright 2011 Antony Harfield. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipesViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIGestureRecognizerDelegate> {
    
    UILabel *artistLabel;
    UIPickerView *pickerView;
    NSArray *pickerItems;
    
}

@property(nonatomic,retain) IBOutlet UILabel *artistLabel;
@property(nonatomic,retain) IBOutlet UIPickerView *pickerView;

- (IBAction)showPicker;
- (IBAction)hidePicker;

@end
