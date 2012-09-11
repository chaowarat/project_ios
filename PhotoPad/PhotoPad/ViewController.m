//
//  ViewController.m
//  PhotoPad
//
//  Created by student on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize scrollView;

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)updateUI
{
    self.scrollView.contentSize = CGSizeMake(768, 3000);
    NSLog(@"Found %d images...",results.count);
    int startX = 0, startY = 0;
    for (int i = 0; i<results.count; i++) {
        NSDictionary *item = [results objectAtIndex:i];
        NSString *imageTitle = [item valueForKey:@"title"];
        NSString *imageFarm = [item valueForKey:@"farm"];
        NSString *imageServerID = [item valueForKey:@"server"];
        NSString *imageID = [item valueForKey:@"id"];
        NSString *imageSecret = [item valueForKey:@"secret"];
        NSString *imageURL = [NSString stringWithFormat:@"http://farm%@.staticflickr.com/%@/%@_%@.jpg",imageFarm,imageServerID,imageID,imageSecret];
        NSLog(@"Name: %@",imageTitle);
        NSLog(@"URL: %@",imageURL);
        
        NSURL *url = [NSURL URLWithString:imageURL];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(startX, startY, 200, 200)];
        startX += 200;
        if (startX > 600) {
            startX = 0;
            startY += 200;
        }
        [imageView setImageWithURL:url];
        //[self.view addSubview:imageView];
        [self.scrollView addSubview:imageView];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *search = @"naresuan";
    NSString *urlSearch = [NSString stringWithFormat:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&tags=%@&safe_search=1&per_page=20&format=json&nojsoncallback=1&api_key=38729baf06b4df1ff424ba3263dc860d",search];
    NSURL *url = [NSURL URLWithString:urlSearch];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response,id json) {results = [[json valueForKeyPath:@"photos.photo"] retain];
        [self updateUI];
    }failure:nil];
    [operation start];
    
    [self updateUI];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
