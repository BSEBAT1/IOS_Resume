//
//  PostDetailController.m
//  Berkay Sebat Resume
//
//  Created by macbook pro on 2/18/16.
//  Copyright © 2016 berkaysebat.com. All rights reserved.
//

#import "PostDetailController.h"

@interface PostDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *Post_User;
@property (weak, nonatomic) IBOutlet UITextView *Post_Title;



@property (weak, nonatomic) IBOutlet UITextView *Post_Contents;

@end

@implementation PostDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Post_User.text=self.Current_Obj.User_Name;
    self.Post_Contents.text=self.Current_Obj.Post_Contents;
    self.Post_Title.text=self.Current_Obj.Post_Title;
   
    
    // Do any additional setup after loading the view.
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
