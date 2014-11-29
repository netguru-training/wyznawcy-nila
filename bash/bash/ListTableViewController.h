//
//  ListTableViewController.h
//  bash
//
//  Created by Piotr Pałek on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableItemTableViewCell.h"

@interface ListTableViewController : UITableViewController <ListMenuProtocol>
- (void)addEntry: (NSString *) body;
@end
