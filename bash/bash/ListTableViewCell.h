//
//  ListTableViewCell.h
//  bash
//
//  Created by Piotr Pałek on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@protocol ListMenuProtocol <NSObject>
- (void) showMenu:(NSString *)bashBody;
@end

@interface ListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellScore;
@property (weak, nonatomic) IBOutlet UILabel *cellBody;
@property id <ListMenuProtocol> delegate;
@property (strong, nonatomic) Entry *entry;
@end
