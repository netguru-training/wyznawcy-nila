//
//  entriesManager.h
//  bash
//
//  Created by Rafał Gawlik on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Entry;
@interface EntriesManager : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

- (void)add:(Entry *)attributes;
- (void)remove:(Entry *)entry;
- (void)removeAtIndex:(NSInteger)eIndex;

@end
