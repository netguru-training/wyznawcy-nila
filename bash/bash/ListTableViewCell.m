//
//  ListTableViewCell.m
//  bash
//
//  Created by Piotr Pałek on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (void)awakeFromNib {
    UILongPressGestureRecognizer *recoginzer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cellLongPress:)];
    [self addGestureRecognizer:recoginzer];
}

- (IBAction)cellLongPress:(UILongPressGestureRecognizer *)caller {
    if (caller.state == UIGestureRecognizerStateBegan) {
        [self.delegate showMenu:self.entry.body];
    }
}

@end
