//
//  GalleryViewController.m
//  CarPrice
//
//  Created by ccc-mac on 13/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GalleryViewController.h"
#import "AFNetworking.h"
#import "Car.h"

@implementation GalleryViewController
@synthesize scrollView;

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
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)updateCarImage
{  
    self.scrollView.contentSize = CGSizeMake(320, 3000);
    int startY = 0;
	for (int i = 0; i<results.count; i++) {
        NSDictionary *item = [results objectAtIndex:i];
        NSString *image = [item valueForKey:@"image"];
        NSString *imageURL = [NSString stringWithFormat:@"http://www.padcraft.co.uk/complang/images/cars/%@",image];
        imageURL = [imageURL stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
        
        NSURL *url = [NSURL URLWithString:imageURL];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, startY, 320, 320)];
        startY += 220;
        [imageView setImageWithURL:url];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:imageView];
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *urlSearch = [NSString stringWithFormat:@"http://www.padcraft.co.uk/complang/cars.json"];
    
    NSURL *url = [NSURL URLWithString:urlSearch];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response,id json) {results = [[json valueForKeyPath:@"cars"] retain];
        [self updateCarImage];
    }failure:nil];
    [operation start];
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
