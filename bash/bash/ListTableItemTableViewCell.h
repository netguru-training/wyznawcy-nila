//
//  ListTableItemTableViewCell.h
//  bash
//
//  Created by Piotr Pałek on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListMenuProtocol <NSObject>
- (void) showMenu;
@end

@interface ListTableItemTableViewCell : UITableViewCell
@property (weak, nonatomic) id <ListMenuProtocol> delegate;
@end
