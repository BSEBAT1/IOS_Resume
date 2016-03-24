//
//  ProjectsViewController.m
//  Berkay Sebat Resume
//
//  Created by macbook pro on 2/7/16.
//  Copyright © 2016 berkaysebat.com. All rights reserved.
//

#import "ProjectsViewController.h"
#import "DetailsViewController.h"
#import "Guestbook.h"
#import "GuestbookWallController.h"
#import "Postview.h"



@interface ProjectsViewController ()


@end

@implementation ProjectsViewController{
    NSMutableArray *project_list;
    
}
@synthesize Guestpch;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   project_list=[[NSMutableArray alloc]init];
    
    Projects *memento=[[Projects alloc]init];
    memento.Project_Name=@"Memento";
    memento.Project_Details=@"\t \t \t \t \t \t \t \t \t Memento is an alternative to current content sharing apps. Instead of instant transmission of content users create content that is saved and hidden to their current location. Other users can stumble upon this content which is kept hidden until the user enters the geo-fence created around it";
    memento.Project_Photo=@"memento";
    
    [project_list addObject:memento];
    
    Projects *it_degree=[[Projects alloc]init];
    it_degree.Project_Name=@"IT Degree";
    it_degree.Project_Details=@"I graduated in 2014 with a degree in Computer Information Technology from Hofstra University. Our courses focused on networking and data anaylitcs but included foundations of computer science classes in Java";
    it_degree.Project_Photo=@"hofstra";
    
    [project_list addObject:it_degree];
    
    Projects *Mirror=[[Projects alloc]init];
    Mirror.Project_Name=@"Mirror";
    Mirror.Project_Details=@"\t \t \t \t \t \t \t \t \t This was my first entrepreneurial project. The mirror was intended to be a cheap tablet replacement for developing countries. I worked on this idea during my senior year of college entering the finals of the Hofstra University Entrepreneurship competition but loosing the 100,000 grand prize to a software startup. The tablet worked by taking advantage of the MHL 3.0 standard developed by Silicon Image Systems in California. The design called for a low cost image processor attached to a battery and a screen all housed in a plastic case. Once connected to the tablet two way signaling between a touch screen and the phone would effectively mirror the phone into a tablet device. I stopped working on this idea after patent problems with ASUS";
    
    Mirror.Project_Photo=@"tablet";
    
    [project_list addObject:Mirror];
    
    Projects *maps=[[Projects alloc]init];
    maps.Project_Name=@"Risk Maps";
    maps.Project_Details=@"\t \t \t \t \t \t \t \t \t  My favorite project that I have done at INFORM Applications. This page connects to a MYSQL database to plot the location and financial details of every single YUM! BRANDS restaurants(KFC,TACOBELL,etc).Previously this data was stored in gigantic Excel sheet. I uploaded the CSV to a MSYQL DB and used XML DOM notation to get the data which I looped through using JS to create a plot and details of the restaurants. I then connected the page to live weather and disasters services using Google KML live feed API.This page is used by risk managers to help asses insurance claims during catastrophic events.";
    maps.Project_Photo=@"map";
    
    [project_list addObject:maps];
    
    Projects *webfocus=[[Projects alloc]init];
    webfocus.Project_Name=@"Webfocus";
    webfocus.Project_Details=@"I am currently employed as a WEBFOCUS developer. WEBFOCUS is a data reporting language similar in use to tableau. In my current position I create data visualization to risk managers using data provided by their insurance companies. I am also responsible for integrating newer technologies to our customer portals including JS animations or interfaces with MYSQL DBs. I also meet with our account executives to help create new reports for the client to use. Currently I am working with the data entry department to create better documentation and procedures for data loading and health care auditing. Learning WEBFOCUS has been quite a challenge as with other older languages support is low and documentation is quite lacking. However this did not stop me from attaining my current position";
    webfocus.Project_Photo=@"webfocus";
    
    [project_list addObject:webfocus];
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return project_list.count;
    }
    else if(section==1) {
        return 1;
    }else {
        return 1;
    }
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    if (indexPath.section==0) {
               Projects *project_current=[project_list objectAtIndex:indexPath.row];
        cell.textLabel.text=[project_current Project_Name];
        
        
    }
    
    else if (indexPath.section==1){
        
        Guestbook *Guests;
        Guests=[ Guestpch objectAtIndex:indexPath.row];
        cell.textLabel.text=@"Guestbook View Posts";
        
        
        
    }
    else{
        Guestbook *Post;
        Post=[Guestpch objectAtIndex:indexPath.row];
        cell.textLabel.text=@"Guestbook Make A Post";
        
    }
    
   return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0: [self performSegueWithIdentifier:@"Detail" sender:self];
            break;
        case 1: [self performSegueWithIdentifier:@"Guestbook" sender:self];
            break;
        case 2:[self performSegueWithIdentifier:@"Post" sender: self];
            
        default: break;
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"Detail"]) {
    DetailsViewController *details_view=[segue destinationViewController];
    NSIndexPath *path=[self.tableView indexPathForSelectedRow];
    NSIndexPath *section=project_list[path.section];
    
        Projects *current_proj=project_list[path.row];
        [details_view setCurrentProject:current_proj];
  
        
    }
    else if ([[segue identifier] isEqualToString:@"Guestbook"]){
        
        GuestbookWallController *guest_book_post_view=[segue destinationViewController];
        [guest_book_post_view setIs_Set:@"yes"];
    }
    
    else if ([[segue identifier] isEqualToString:@"Post"]){
        PostView *post_it=[segue destinationViewController];
        [post_it setPost_set:@"yes"];
        
    }
    
}



@end
