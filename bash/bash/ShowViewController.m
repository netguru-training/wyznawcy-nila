//
//  ShowViewController.m
//  bash
//
//  Created by Radosław Piątek on 30/11/14.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "ShowViewController.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
