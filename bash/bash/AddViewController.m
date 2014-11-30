//
//  AddViewController.m
//  bash
//
//  Created by Piotr Pałek on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextView *bodyText;
@property (weak, nonatomic) ViewController *viewController;
@end

@implementation AddViewController
- (IBAction)addTap:(id)sender {
    if (self.bodyText.text.length == 0) {
        
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Uncool!"
                                                        message:@"Please write text before adding a new element.\nFor instance 'dupa'"
                                                       delegate:nil
                                              cancelButtonTitle:@"ok"
                                              otherButtonTitles:nil, nil];
        
        UIImage* imgMyImage = [UIImage imageNamed:@"uncool.png"];
        UIImageView* ivMyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgMyImage.size.width, imgMyImage.size.height)];
        [ivMyImageView setImage:imgMyImage];
        
        [alert setValue: ivMyImageView forKey:@"accessoryView"];
        [alert show];
        
        
        return;
    }
    [self.tableController addEntry:self.bodyText.text user:self.userName.text];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // do nothing!
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.bodyText becomeFirstResponder];
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
