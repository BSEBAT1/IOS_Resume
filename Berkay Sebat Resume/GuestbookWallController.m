//
//  GuestbookWallController.m
//  Berkay Sebat Resume
//
//  Created by macbook pro on 2/15/16.
//  Copyright © 2016 berkaysebat.com. All rights reserved.
//

#import "GuestbookWallController.h"
#import "ProjectsViewController.h"
#import "DetailsViewController.h"
#import "Guestbook.h"
#import "GuestbookWallController.h"
#import "Postview.h"
#import "PostDetailController.h"

@interface GuestbookWallController ()

@end

@implementation GuestbookWallController
@synthesize jsonArray,GuestbookArray,jsonArrayB;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self retrieveData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

   return GuestbookArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellz" forIndexPath:indexPath];
    
    Guestbook *Guest;
    Guest=[ GuestbookArray objectAtIndex:indexPath.row];
    cell.textLabel.text=[Guest Post_Title];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"PostDetail" sender:self];
    
    
    }
#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"PostDetail"]){
    PostDetailController *go_here=[segue destinationViewController];
    NSIndexPath *path_two=[self.tableView indexPathForSelectedRow];
    Guestbook *current_selection=GuestbookArray[path_two.row];
    
        [go_here setCurrent_Obj:current_selection];
    }
    
}


-(void)retrieveData
{
    NSString *getdataurl=@"http://www.berkaysebat.com/json_get_data.php";
    NSURL *url=[NSURL URLWithString:getdataurl];
    
    NSData *data=[NSData dataWithContentsOfURL:url];
    jsonArrayB=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    jsonArray=[jsonArrayB objectForKey:@"server_res"];
    
    
    
    
    GuestbookArray=[[NSMutableArray alloc]init];
    
    for (int i=0; i<jsonArray.count; i++) {
        NSString *name=[[jsonArray objectAtIndex:i] objectForKey:@"name"];
        NSString *title=[[jsonArray objectAtIndex:i]objectForKey:@"user_name"];
        NSString *post=[[jsonArray objectAtIndex:i]objectForKey:@"user_pass"];
        
        [GuestbookArray addObject:[[Guestbook alloc]initWithTitle:title andUserName:name andContents:post]];
        
    }
    
    
    [self.tableView reloadData];
    
}

@end
