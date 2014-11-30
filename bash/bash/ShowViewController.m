//
//  ShowViewController.m
//  bash
//
//  Created by Radosław Piątek on 30/11/14.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "ShowViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.userNameLabel.text = self.entry.user;
    self.entryScoreLabel.text = [NSString stringWithFormat:@"%ld", (long)self.entry.score];
    self.entryBodyTextView.text = self.entry.body;
    [self styleBodyTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)styleBodyTextView {
    self.entryBodyTextView.layer.borderWidth = 1;
    self.entryBodyTextView.layer.borderColor = [UIColor colorWithRed:230.0f/255.0f green:230.0f/255.0f blue:230.0f/255.0f alpha:1.0f].CGColor;
    self.entryBodyTextView.layer.cornerRadius = 5;
}

@end
