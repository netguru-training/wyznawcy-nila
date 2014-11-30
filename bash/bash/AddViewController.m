//
//  AddViewController.m
//  bash
//
//  Created by Piotr Pałek on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "AddViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AddViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextView *bodyText;
@property (weak, nonatomic) ViewController *viewController;
@end

@implementation AddViewController
- (IBAction)addTap:(id)sender {
    if (self.bodyText.text.length == 0) {
        [[[UIAlertView alloc] initWithTitle:@"Entry text"
                                    message:@"Please write text before adding a new element.\nFor instance 'dupa'"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil
          ]
         show];
        return;
    }
    [self.tableController addEntry:self.bodyText.text user:self.userName.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"Write something..."]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Write something...";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // do nothing!
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.bodyText becomeFirstResponder];
    [self styleBodyTextView];
    // Do any additional setup after loading the view.
}

- (void)styleBodyTextView {
    self.bodyText.text = @"Write something...";
    self.bodyText.textColor = [UIColor lightGrayColor]; //optional
    self.bodyText.layer.borderWidth = 1;
    self.bodyText.layer.borderColor = [UIColor colorWithRed:230.0f/255.0f green:230.0f/255.0f blue:230.0f/255.0f alpha:1.0f].CGColor;
    self.bodyText.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
