//
//  SlackNotifier.h
//  bash
//
//  Created by Bartosz Kopiński on 30/11/14.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface SlackNotifier : NSObject

- (BOOL)notifyNewEntry:(Entry *)entry;

@end
