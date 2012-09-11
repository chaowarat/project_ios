//
//  RootViewController.m
//  CarPrice
//
//  Created by student on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"
#import "CarData.h"
#import "Car.h"
#import "AFNetworking.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)updateCarList
{
    NSLog(@"Found %d images...",results.count);
    for (int i = 0; i<results.count; i++) {
        Car *car = [[Car alloc] init];
        NSDictionary *item = [results objectAtIndex:i];
        car.manufacture = [item valueForKey:@"manufacturer"];
        car.model = [item valueForKey:@"model"];
        car.year = [item valueForKey:@"year"];
        car.price = [item valueForKey:@"price"];
        car.available = [item valueForKey:@"available"];
        NSString *image = [item valueForKey:@"image"];
        car.image = [NSString stringWithFormat:@"http://www.padcraft.co.uk/complang/images/cars/%@.jpg",image];
        
        if ([car.price intValue] < 500000 ) {
            [listSmallPrice addObject:car];
        }
        else {
            [listBigPrice addObject:car];
        }
        NSLog(@"manu: %@",car.price);
    }
[self.tableView reloadData];
}

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
    
    NSString *urlSearch = [NSString stringWithFormat:@"http://www.padcraft.co.uk/complang/cars.json"];
    NSURL *url = [NSURL URLWithString:urlSearch];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response,id json) {results = [[json valueForKeyPath:@"cars"] retain];
        [self updateCarList];
    }failure:nil];
    [operation start];

    self.navigationItem.title = @"Car Price Comparison";
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
    UILabel* labelOption = [[UILabel alloc] initWithFrame:CGRectMake(240, 0, 100, 40)];
    labelOption.textColor = [UIColor blackColor];
    labelOption.backgroundColor = [UIColor clearColor];
    labelOption.textAlignment = UITextAlignmentCenter;
    labelOption.font = [UIFont fontWithName:@"Chalkboard SE" size:14];
    
    Car *car = [[Car alloc] init];
    if (indexPath.section == 0) {
        car = [listSmallPrice objectAtIndex:indexPath.row];
    }
    else{
        car = [listBigPrice objectAtIndex:indexPath.row];
    }
    labelOption.text = car.image;
    [cell addSubview:labelOption];
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





