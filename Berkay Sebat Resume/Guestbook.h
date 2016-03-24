//
//  Guestbook.h
//  Berkay Sebat Resume
//
//  Created by macbook pro on 2/14/16.
//  Copyright © 2016 berkaysebat.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Guestbook : NSObject
@property NSString *Post_Title;
@property NSString *User_Name;
@property NSString *Post_Contents;

-(id) initWithTitle: (NSString *) post_title andUserName: (NSString *)user_name andContents: (NSString *) post_contents;
    
    

@end
