//
//  RootViewController.m
//  Contacts2
//
//  Created by student on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"
#import "Contact.h"

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

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];  
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"Contacts";
    
    NSMutableArray *mutArr = [[NSMutableArray alloc] initWithCapacity:8];
    
    Contact *contact1 = [[Contact alloc] init];
    contact1.firstName = @"Antony";
    contact1.lastName = @"Harfield";
    contact1.phone = @"07743795826";
    contact1.email = @"antonyh@nu.ac.th";
    //[mutArr addObject:contact1];
    //[contact1 release];
    
    Contact *contact2 = [[Contact alloc] init];
    contact2.firstName = @"Bjoern";
    contact2.lastName = @"Wilhelm";
    contact2.phone = @"08739750938";
    contact2.email = @"bjoern@nu.ac.th";
    //[mutArr addObject:contact2];
    //[contact2 release];
    
    Contact *contact3 = [[Contact alloc] init];
    contact3.firstName = @"James";
    contact3.lastName = @"Nally";
    contact3.phone = @"07500831123";
    contact3.email = @"nally@gmail.com";
    //[mutArr addObject:contact3];
    //[contact3 release];
    
    Contact *contact4 = [[Contact alloc] init];
    contact4.firstName = @"Michael";
    contact4.lastName = @"Kolkman";
    contact4.phone = @"0793904123";
    contact4.email = @"kolk@kolkman.de";
    //[mutArr addObject:contact4];
    //[contact4 release];
    
    Contact *contact5 = [[Contact alloc] init];
    contact5.firstName = @"Steve";
    contact5.lastName = @"Russ";
    contact5.phone = @"07948275639";
    contact5.email = @"steve.russ@warwick.ac.uk";
    //[mutArr addObject:contact5];
    //[contact5 release];
    
    Contact *contact6 = [[Contact alloc] init];
    contact6.firstName = @"Rebecca";
    contact6.lastName = @"Sinclair";
    contact6.phone = @"01903679832";
    contact6.email = @"becs@hotmail.com";
    [mutArr addObject:contact6];
    [contact6 release];
    
    Contact *contact7 = [[Contact alloc] init];
    contact7.firstName = @"Eleonore";
    contact7.lastName = @"Touzelet";
    contact7.phone = @"0651456450";
    contact7.email = @"eleonore@gmail.com";
    [mutArr addObject:contact7];
    [contact7 release];
    
    Contact *contact8 = [[Contact alloc] init];
    contact8.firstName = @"Edward";
    contact8.lastName = @"Young";
    contact8.phone = @"0983476890";
    contact8.email = @"eddie@hotmail.com";
    [mutArr addObject:contact8];
    [contact8 release];
    
    contacts = mutArr;
    
    NSMutableArray *mutArrFriends = [[NSMutableArray alloc] initWithCapacity:3];
    
    [mutArrFriends addObject:contact1];
    [contact1 release];
    
    [mutArrFriends addObject:contact2];
    [contact2 release];
    
    [mutArrFriends addObject:contact3];
    [contact3 release];
    
    contactFriends = mutArrFriends;
    
    NSMutableArray *mutArrOther = [[NSMutableArray alloc] initWithCapacity:2];
    
    [mutArrOther addObject:contact4];
    [contact4 release];
    
    [mutArrOther addObject:contact5];
    [contact5 release];

    contactOther = mutArrOther;

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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [contacts count] + [contactFriends count] + [contactOther count];
    if(section == 0){
        return [contacts count];
    }
    else if(section == 1){
        return [contactFriends count];
    }
    else {
        return [contactOther count];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return @"family";
    }
    if(section == 1){
        return @"Friends";
    }
    return @"Other";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    Contact *contact;
    
    if (indexPath.section == 0) {
        contact = [contacts objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1) {
        contact = [contactFriends objectAtIndex:indexPath.row];
    }
    else {
        contact = [contactOther objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    cell.detailTextLabel.text = contact.email;
    
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
    Contact *contact;
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    
    if (indexPath.section == 0) {
        contact = [contacts objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1) {
        contact = [contactFriends objectAtIndex:indexPath.row];
    }
    else {
        contact = [contactOther objectAtIndex:indexPath.row];
    }
    detailViewController.contact = contact;

    [self.navigationController pushViewController:detailViewController animated:YES]; 

}

@end
