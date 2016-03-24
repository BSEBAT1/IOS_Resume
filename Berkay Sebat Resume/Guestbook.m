//
//  Guestbook.m
//  Berkay Sebat Resume
//
//  Created by macbook pro on 2/14/16.
//  Copyright © 2016 berkaysebat.com. All rights reserved.
//

#import "Guestbook.h"

@implementation Guestbook
@synthesize Post_Title,Post_Contents,User_Name;

-(id) initWithTitle: (NSString *) post_title andUserName: (NSString *)user_name andContents: (NSString *) post_contents{
    self=[super init];
    if (self) {
    
        Post_Title=post_title;
        Post_Contents=post_contents;
        User_Name=user_name;
    }
    return self;
}
@end
