//
//  DetailViewController.m
//  Contacts2
//
//  Created by student on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "AFNetworking.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize imageView, item;
//@synthesize label;


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if(item != nil){
        imageURL = [item valueForKey:@"url"];
    
        NSURL *url = [NSURL URLWithString:imageURL];
        UIImage *placeholder = [UIImage imageNamed:@"placeholder.png"];
    
        [self.imageView setImageWithURL:url placeholderImage:placeholder];
        NSLog(@"AAAAAA : %@",url);
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
