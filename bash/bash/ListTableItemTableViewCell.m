//
//  ListTableItemTableViewCell.m
//  bash
//
//  Created by Piotr Pałek on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "ListTableItemTableViewCell.h"

@implementation ListTableItemTableViewCell

- (void)awakeFromNib {
    UILongPressGestureRecognizer *recoginzer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cellLongPress:)];
    [self addGestureRecognizer:recoginzer];
}

- (IBAction)cellLongPress:(UILongPressGestureRecognizer *)sender {
    if (sender.state == 1) {
        [self.delegate showMenu];
    }
}

@end
