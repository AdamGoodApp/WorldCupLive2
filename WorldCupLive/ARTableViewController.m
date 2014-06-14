//
//  ARTableViewController.m
//  WorldCupLive
//
//  Created by Adam Rais on 14/06/2014.
//  Copyright (c) 2014 Adam Rais. All rights reserved.
//

#import "ARTableViewController.h"
#import "ARModal.h"

@interface ARTableViewController ()

@end

@implementation ARTableViewController

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
    self.blogPost = [[ARModal alloc] init];
    self.blogPost.jsonMutable = [NSMutableArray array];
    
    for (NSDictionary *post in self.blogPost.blogData) {
        ARModal *bp = [ARModal blogPostWithHome:[[post objectForKey:@"home"] objectForKey:@"text"]];
        bp.away = [[post objectForKey:@"away"] objectForKey:@"text"];
        bp.result = [[post objectForKey:@"result"] objectForKey:@"text"];
        bp.info = [post objectForKey:@"info"];
        bp.homeImage = [[post objectForKey:@"homeimage"] objectForKey:@"src"];
        [self.blogPost.jsonMutable addObject:bp];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.blogPost.jsonMutable count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    ARModal *post = [self.blogPost.jsonMutable objectAtIndex:indexPath.row];
    NSData *imageData = [NSData dataWithContentsOfURL:post.jsonURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    cell.textLabel.text = [[[[[post.home stringByAppendingString:@" "]stringByAppendingString:@" "] stringByAppendingString:post.bst] stringByAppendingString:@" "] stringByAppendingString:post.away];
    cell.detailTextLabel.text = post.info;
    cell.imageView.image = image;
    
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
