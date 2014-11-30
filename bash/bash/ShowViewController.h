//
//  ShowViewController.h
//  bash
//
//  Created by Radosław Piątek on 30/11/14.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface ShowViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *entryScoreLabel;
@property (weak, nonatomic) IBOutlet UITextView *entryBodyTextView;
@property Entry *entry;
@end
