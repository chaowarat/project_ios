//
//  SwipesViewController.m
//  Swipes
//
//  Created by Antony Harfield on 13/09/2011.
//  Copyright 2011 Antony Harfield. All rights reserved.
//

#import "SwipesViewController.h"

@implementation SwipesViewController

@synthesize artistLabel, pickerView;

#pragma mark - Actions

- (IBAction)showPicker {
    if (pickerView.frame.origin.y == 460) {
        // Slide picker up
        [UIView beginAnimations:nil context:nil];
        pickerView.frame = CGRectOffset(pickerView.frame, 0, -216);
        [UIView commitAnimations];
    }
}

- (IBAction)hidePicker {
    if (pickerView.frame.origin.y == 244) {
        // Slide picker down
        [UIView beginAnimations:nil context:nil];
        pickerView.frame = CGRectOffset(pickerView.frame, 0, 216);
        [UIView commitAnimations];
    }
    
}

#pragma mark - Gesture methods

/*
// This method stops the gesture recognizer from working inside the pickerView (must set recognizer.delegate = self)
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (touch.view == pickerView || [[pickerView subviews] containsObject:touch.view]) {
        return NO;
    }
    return YES;
}
*/

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Items for the picker
    pickerItems = [[NSArray alloc] initWithObjects:@"At The Drive In", @"The Beatles", @"Cranberries", @"Da Endorphine", @"Evanescence", @"Florence and the Machine", @"Green Day", @"Hefner", @"Idlewild", @"Jack Johnson", @"Kasabian", @"Lady Gaga", @"Muse", @"Nirvana", @"Ocean Colour Scene", @"Palmy", @"Rage Against The Machine", @"Singular", @"Taylor Swift", @"Vex Red", @"The White Stripes", nil];
    
    // Set up the gestures
    // TODO
 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.artistLabel = nil;
    self.pickerView = nil;
}

#pragma mark - Picker data source and delegate methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [pickerItems count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [pickerItems objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    artistLabel.text = [pickerItems objectAtIndex:row];
}

@end
