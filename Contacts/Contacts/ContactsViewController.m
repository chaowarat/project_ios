//
//  ContactsViewController.m
//  Contacts
//
//  Created by Antony Harfield on 11/08/2011.
//

#import "ContactsViewController.h"
#import "Contact.h"

@implementation ContactsViewController

#pragma mark Table data source and delegate methods

// TODO


#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *mutArr = [[NSMutableArray alloc] initWithCapacity:8];
    
    Contact *contact1 = [[Contact alloc] init];
    contact1.firstName = @"Antony";
    contact1.lastName = @"Harfield";
    contact1.phone = @"07743795826";
    contact1.email = @"antonyh@nu.ac.th";
    [mutArr addObject:contact1];
    [contact1 release];
    
    Contact *contact2 = [[Contact alloc] init];
    contact2.firstName = @"Bjoern";
    contact2.lastName = @"Wilhelm";
    contact2.phone = @"08739750938";
    contact2.email = @"bjoern@nu.ac.th";
    [mutArr addObject:contact2];
    [contact2 release];
    
    Contact *contact3 = [[Contact alloc] init];
    contact3.firstName = @"James";
    contact3.lastName = @"Nally";
    contact3.phone = @"07500831123";
    contact3.email = @"nally@gmail.com";
    [mutArr addObject:contact3];
    [contact3 release];

    Contact *contact4 = [[Contact alloc] init];
    contact4.firstName = @"Michael";
    contact4.lastName = @"Kolkman";
    contact4.phone = @"0793904123";
    contact4.email = @"kolk@kolkman.de";
    [mutArr addObject:contact4];
    [contact4 release];
    
    Contact *contact5 = [[Contact alloc] init];
    contact5.firstName = @"Steve";
    contact5.lastName = @"Russ";
    contact5.phone = @"07948275639";
    contact5.email = @"steve.russ@warwick.ac.uk";
    [mutArr addObject:contact5];
    [contact5 release];

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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    //cell.textLabel.text = [NSString stringWithFormat:@"Item %d", indexPath.row];
    Contact *contact = [contacts objectAtIndex:indexPath.row];
    NSString *item = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    cell.textLabel.text = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Contact *contact = [contacts objectAtIndex:indexPath.row];
    NSString *name = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    NSString *phoneAndEmail = [NSString stringWithFormat:@"Phone: %@\nEmail: %@", contact.phone, contact.email];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:name message:phoneAndEmail delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    [alert release];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    [contacts release];
    contacts = nil;
}

- (void)dealloc {
    [contacts release];
    [super dealloc];
}

@end
