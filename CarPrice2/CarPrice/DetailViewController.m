//
//  DetailViewController.m
//  CarPrice
//
//  Created by student on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "PhotoViewController.h"
#import "AFNetworking.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize car, labelManufacture, labelModel, labelYear;
@synthesize segment, labelPrice, labelAvailable;


- (void)updateUI
{
    NSLog(@"Found %d images...",results.count);
    for (int i = 0; i<results.count; i++) {
        NSDictionary *item = [results objectAtIndex:i];
        car.manufacture = [item valueForKey:@"manufacturer"];
        car.model = [item valueForKey:@"model"];
        car.year = [item valueForKey:@"year"];
        car.available = [item valueForKey:@"available"];
        NSString *image = [item valueForKey:@"image"];
        car.image = [NSString stringWithFormat:@"http://www.padcraft.co.uk/complang/images/cars/%@.jpg",image];

        NSLog(@"manu: %@",[item valueForKey:@"manufacturer"]);
    }
}
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
    
    NSString *urlSearch = [NSString stringWithFormat:@"http://www.padcraft.co.uk/complang/cars.json"];
    NSURL *url = [NSURL URLWithString:urlSearch];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response,id json) {results = [[json valueForKeyPath:@"cars"] retain];
        [self updateUI];
    }failure:nil];
    [operation start];
    
    UIFont *font = [UIFont fontWithName:@"Chalkboard SE" size:20];
    
    labelManufacture.text = [NSString stringWithFormat: @"Manufacture:  %@", car.manufacture];
    labelManufacture.font = font;
    labelModel.text = [NSString stringWithFormat:@"Model:        %@", car.model];
    labelModel.font = font;
    labelYear.text = [NSString stringWithFormat:@"Year:         %@", car.year];
    labelYear.font = font;
    
    NSNumberFormatter * formatter = [[[NSNumberFormatter alloc] init] autorelease];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    formatter.currencyCode = @"";
    formatter.maximumFractionDigits = 0;
    NSString * formattedAmount = [formatter stringFromNumber: [NSNumber numberWithFloat: [car.price intValue]]];
    
    labelPrice.text = [NSString stringWithFormat:@"Price:        %@ Bath", formattedAmount];
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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
