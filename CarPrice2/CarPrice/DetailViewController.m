//
//  DetailViewController.m
//  CarPrice
//
//  Created by student on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize car, labelManufacture, labelModel, labelYear;
@synthesize segment, labelPrice, labelAvailable, imageView;

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
    self.view.backgroundColor = [UIColor grayColor];
    UIFont *font = [UIFont fontWithName:@"Chalkboard SE" size:20];
    
    labelManufacture.text = [NSString stringWithFormat: @"%@", car.manufacture];
    labelManufacture.font = font;
    labelModel.text = [NSString stringWithFormat:@"%@", car.model];
    labelModel.font = font;
    labelYear.text = [NSString stringWithFormat:@"%@", car.year];
    labelYear.font = font;
    
    NSNumberFormatter * formatter = [[[NSNumberFormatter alloc] init] autorelease];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    formatter.currencyCode = @"";
    formatter.maximumFractionDigits = 0;
    NSString * formattedAmount = [formatter stringFromNumber: [NSNumber numberWithFloat: [car.price intValue]]];
    
    labelPrice.text = [NSString stringWithFormat:@"%@ Bath", formattedAmount];
    labelPrice.font = font;
    labelAvailable.text = [NSString stringWithFormat:@"%@", car.available];
    labelAvailable.font = font;
}

- (BOOL)loadImage:(NSURL *)inURL {
    NSURLRequest *request = [NSURLRequest requestWithURL:inURL];
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if (conn) {
        receivedData = [[NSMutableData data] retain];
    } else {
        return FALSE;
    }
    return TRUE;
}

- (void)connection:(NSURLConnection *)conn didReceiveResponse:(NSURLResponse *)response {
    [receivedData setLength:0]; 
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data {
    [receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)conn {
    NSLog(@"Succeeded! Received %d bytes of data", [receivedData length]);
    [self.imageView setImage:[UIImage imageWithData:receivedData]];
    [receivedData release];
}

- (IBAction)touchButton:(id)sender{
    if (segment.selectedSegmentIndex == 1) {
        imageView.hidden = false;
        [self.imageView setImage:[UIImage imageNamed:@"loading.png"]];
        NSString* imageURL = car.image;
        imageURL = [imageURL stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
        
        NSURL *url = [NSURL URLWithString:imageURL];
        [self loadImage:url];
    }
    else{
        imageView.hidden = true;
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
