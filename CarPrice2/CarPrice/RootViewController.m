//
//  RootViewController.m
//  CarPrice
//
//  Created by student on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"
#import "Car.h"

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize listBigPrice, listSmallPrice;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Car Price";
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return @"Less than 500,000 bath";
    }
    else{
        return @"Less than 1,000,000 bath";
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return [listSmallPrice count];
    }
    else{
        return [listBigPrice count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Car *car = [[Car alloc] init];
    if (indexPath.section == 0) {
        car = [listSmallPrice objectAtIndex:indexPath.row];
    }
    else{
        car = [listBigPrice objectAtIndex:indexPath.row];
    }
    cell.textLabel.font = [UIFont fontWithName:@"Chalkboard SE" size:20];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", car.manufacture, car.model];

    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Car *car = [[Car alloc] init];
    if (indexPath.section == 0) {
        car = [listSmallPrice objectAtIndex:indexPath.row];
    }
    else{
        car = [listBigPrice objectAtIndex:indexPath.row];
    }
    
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.car = car;

    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil] autorelease];
    
    detailViewController.navigationItem.title = [NSString stringWithFormat:@"%@ %@", car.manufacture, car.model];
    
    [self.navigationController pushViewController:detailViewController animated:YES]; 

}

@end





