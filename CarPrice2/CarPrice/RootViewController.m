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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Car Price";
    self.tableView.backgroundColor = [UIColor grayColor];
    self.tableView.separatorStyle = NO;
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
    UILabel *topLabel;
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        topLabel =[[[UILabel alloc] initWithFrame:CGRectMake(20,10,300,20)]autorelease];
		[cell.contentView addSubview:topLabel];
        
		topLabel.backgroundColor = [UIColor clearColor];
		topLabel.textColor = [UIColor colorWithRed:0.25 green:0.0 blue:0.0 alpha:1.0];
		topLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		topLabel.font = [UIFont systemFontOfSize:30];
        
		// Create a background image view.
		cell.backgroundView =
        [[[UIImageView alloc] init] autorelease];
		cell.selectedBackgroundView =
        [[[UIImageView alloc] init] autorelease];
    }
    else
	{
		topLabel = (UILabel *)[cell viewWithTag:10];
	}
    
    
    Car *car = [[Car alloc] init];
    if (indexPath.section == 0) {
        car = [listSmallPrice objectAtIndex:indexPath.row];
    }
    else{
        car = [listBigPrice objectAtIndex:indexPath.row];
    }
    topLabel.font = [UIFont fontWithName:@"Chalkboard SE" size:20];
    topLabel.text = [NSString stringWithFormat:@"%@ %@", car.manufacture, car.model];
    
    UIImage *rowBackground;
	UIImage *selectionBackground;
	NSInteger sectionRows = [tableView numberOfRowsInSection:[indexPath section]];
	NSInteger row = [indexPath row];
	if (row == 0 && row == sectionRows - 1)
	{
		rowBackground = [UIImage imageNamed:@"topAndBottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"topAndBottomRowSelected.png"];
	}
	else if (row == 0)
	{
		rowBackground = [UIImage imageNamed:@"topRow.png"];
		selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
	}
	else if (row == sectionRows - 1)
	{
		rowBackground = [UIImage imageNamed:@"bottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
	}
	else
	{
		rowBackground = [UIImage imageNamed:@"middleRow.png"];
		selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
	}
	((UIImageView *)cell.backgroundView).image = rowBackground;
	((UIImageView *)cell.selectedBackgroundView).image = selectionBackground;
	
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





