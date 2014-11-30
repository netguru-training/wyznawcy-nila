//
//  ListTableViewController.h
//  bash
//
//  Created by Piotr Pałek on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableViewCell.h"

@protocol ListTableViewControllerDelegate <NSObject>
- (void) tableViewDidSelectEntry:(Entry *)entry;
- (void) tableViewDidFinishFetch;
- (void) tableViewDidInitiateFetch;
@end

@interface ListTableViewController : UITableViewController
- (void)addEntry: (NSString *)body user:(NSString *)user;
@property (weak) id <ListTableViewControllerDelegate> delegate;
@end
