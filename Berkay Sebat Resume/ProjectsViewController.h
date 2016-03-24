//
//  ProjectsViewController.h
//  Berkay Sebat Resume
//
//  Created by macbook pro on 2/7/16.
//  Copyright © 2016 berkaysebat.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Projects.h"
#import "Guestbook.h"

@interface ProjectsViewController : UITableViewController
@property Projects *CurrentProject;
@property NSMutableArray *jsonArray;
@property NSMutableDictionary *jsonArrayB;
@property NSMutableArray *GuestbookArray;
@property NSMutableArray *Guestpch;
-(void) retrieveData;

@end
