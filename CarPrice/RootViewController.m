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

@interface RootViewController ()

@end

@implementation RootViewController

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
    listSmallPrice = [CarData smallPrice];
    listBigPrice = [CarData bigPrice];

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
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    UILabel* labelOption = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 100, 40)];
    labelOption.textColor = [UIColor blackColor];
    labelOption.backgroundColor = [UIColor clearColor];
    labelOption.textAlignment = UITextAlignmentCenter;
    labelOption.font = [UIFont fontWithName:@"Chalkboard SE" size:20];
    
    Car *car = [[Car alloc] init];
    if (indexPath.section == 0) {
        car = [listSmallPrice objectAtIndex:indexPath.row];
    }
    else{
        car = [listBigPrice objectAtIndex:indexPath.row];
    }
    labelOption.text = car.option;
    [cell addSubview:labelOption];
    cell.textLabel.font = [UIFont fontWithName:@"Chalkboard SE" size:20];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", car.manufacture, car.model];

    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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





