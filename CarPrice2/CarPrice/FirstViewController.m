//
//  FirstViewController.m
//  CarPrice
//
//  Created by student on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "RootViewController.h"
#import "GalleryViewController.h"
#import "Car.h"
#import "AFNetworking.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

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
    self.navigationController.navigationBarHidden = YES;
}

- (void)updateCarList
{
    for (int i = 0; i<results.count; i++) {
        Car *car = [[Car alloc] init];
        NSDictionary *item = [results objectAtIndex:i];
        car.manufacture = [item valueForKey:@"manufacturer"];
        car.model = [item valueForKey:@"model"];
        car.year = [item valueForKey:@"year"];
        car.price = [item valueForKey:@"price"];
        car.available = [item valueForKey:@"available"];
        NSString *image = [item valueForKey:@"image"];
        car.image = [NSString stringWithFormat:@"http://www.padcraft.co.uk/complang/images/cars/%@",image];
        if ([car.price intValue] < 500000 ) {
            [listSmallPrice addObject:car];
        }
        else {
            [listBigPrice addObject:car];
        }
        [car release];
    }
}

-(IBAction)carPriceTouch:(id)sender{
    RootViewController *rootViewController = [[RootViewController alloc] init];
    rootViewController.listBigPrice = listBigPrice;
    rootViewController.listSmallPrice = listSmallPrice;
    rootViewController.navigationItem.title = self.navigationItem.title;
    
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:nil action:nil] autorelease];
    
    [self.navigationController pushViewController:rootViewController animated:YES];

}

-(IBAction)galleryTouch:(id)sender{
    GalleryViewController *galleryViewController = [[GalleryViewController alloc] init];
    galleryViewController.navigationItem.title = @"Gallery";
    
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil] autorelease];
    
    [self.navigationController pushViewController:galleryViewController animated:YES];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"launch.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    listSmallPrice = [[NSMutableArray alloc] init];
    listBigPrice = [[NSMutableArray alloc] init];
    
    NSString *urlSearch = [NSString stringWithFormat:@"http://www.padcraft.co.uk/complang/cars.json"];
    
    NSURL *url = [NSURL URLWithString:urlSearch];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response,id json) {results = [[json valueForKeyPath:@"cars"] retain];
        [self updateCarList];
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
