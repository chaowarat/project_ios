//
//  DetailViewController.m
//  CarPrice
//
//  Created by student on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "PhotoViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize car, labelManufacture, labelModel, labelYear;
@synthesize segment, labelPrice, labelAvailable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    segment.selectedSegmentIndex = 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIFont *font = [UIFont fontWithName:@"Chalkboard SE" size:20];
    
    labelManufacture.text = [NSString stringWithFormat: @"Manufacture:  %@", car.manufacture];
    labelManufacture.font = font;
    labelModel.text = [NSString stringWithFormat:@"Model:        %@", car.model];
    labelModel.font = font;
    labelYear.text = [NSString stringWithFormat:@"Year:         %@", car.year];
    labelYear.font = font;
    labelPrice.text = [NSString stringWithFormat:@"Price:        %@", car.price];
    labelPrice.font = font;
    labelAvailable.text = [NSString stringWithFormat:@"Available:    %@", car.available];
    labelAvailable.font = font;
}

- (IBAction)touchButton:(id)sender{
    if (segment.selectedSegmentIndex != 0) {
        PhotoViewController *photoViewController = [[PhotoViewController alloc] init];
        photoViewController.navigationItem.title = self.navigationItem.title;
        photoViewController.car = self.car;
        self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil] autorelease];
        
        [self.navigationController pushViewController:photoViewController animated:YES];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
