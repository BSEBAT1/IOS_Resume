//
//  DetailsViewController.m
//  Berkay Sebat Resume
//
//  Created by macbook pro on 2/7/16.
//  Copyright © 2016 berkaysebat.com. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *Current_Image;
@property (weak, nonatomic) IBOutlet UILabel *Current_Label;

@property (weak, nonatomic) IBOutlet UITextView *Text_Detail;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.Current_Label.text=self.CurrentProject.Project_Name;
    self.Text_Detail.text=self.CurrentProject.Project_Details;
    UIImage *image = [UIImage imageNamed:self.CurrentProject.Project_Photo];
    [self.Current_Image setImage:image];
    
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
