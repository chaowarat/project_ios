//
//  ViewController.m
//  ImageFinder
//
//  Created by student on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableView, searchBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    NSURL *url = [NSURL URLWithString:@"https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&q=naresuan"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation  *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        result = [[JSON valueForKeyPath:@"responseData.results"] retain];
        [self updateUI];
        
    }failure:nil];
    
    [operation start];
}

- (void) updateUI{
    NSLog(@"Found %d images...", result.count);
    
    for (int i = 0; i < result.count; i++) {
        NSDictionary *item = [result objectAtIndex:i];
        NSString *imageTitle = [item valueForKey:@"titleNoFormatting"];
        NSString *imageURL = [item valueForKey:@"url"];
        NSLog(@"Name: %@", imageTitle);
        NSLog(@"URL: %@", imageURL);
    }
    
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return result.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSDictionary *item = [result objectAtIndex:indexPath.row];
    NSString *imageTitle = [item valueForKey:@"titleNoFormatting"];
    NSString *imageURL = [item valueForKey:@"url"];
    
    NSURL *url = [NSURL URLWithString:imageURL];
    UIImage *placeholder = [UIImage imageNamed:@"placeholder.png"];
    
    [cell.imageView setImageWithURL:url placeholderImage:placeholder];
    cell.textLabel.text = imageTitle;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *item = [result objectAtIndex:indexPath.row];
    DetailViewController *detailViewController = [[[DetailViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    
    detailViewController.item = item;
        
    [self.navigationController pushViewController:detailViewController animated:YES]; 
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self performSearch];
    [self.searchBar resignFirstResponder];
}

-(void) performSearch{
    NSString *search = [NSString stringWithFormat:@"https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&q=%@", self.searchBar.text];
    NSURL *url = [NSURL URLWithString:search];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation  *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        result = [[JSON valueForKeyPath:@"responseData.results"] retain];
        [self updateUI];
        
    }failure:nil];
    
    [operation start];

}

@end
