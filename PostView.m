//
//  PostView.m
//  Berkay Sebat Resume
//
//  Created by macbook pro on 2/15/16.
//  Copyright © 2016 berkaysebat.com. All rights reserved.
//

#import "PostView.h"

@interface PostView ()
@property (weak, nonatomic) IBOutlet UITextField *User_Name;
@property (weak, nonatomic) IBOutlet UITextField *Post_Title;

@property (weak, nonatomic) IBOutlet UITextView *User_Comments;


@end

@implementation PostView
- (IBAction)Post:(id)sender {
    NSString *noteDataString = [NSString stringWithFormat:@"user_name=%@&user_pass=%@&user=%@",self.User_Comments.text,self.Post_Title.text,self.User_Name.text];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURL *url = [NSURL URLWithString:@"http://www.berkaysebat.com/register.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPBody = [noteDataString dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
    }];
    [postDataTask resume];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
