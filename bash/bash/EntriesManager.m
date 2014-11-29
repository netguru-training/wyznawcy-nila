//
//  entriesManager.m
//  bash
//
//  Created by Rafał Gawlik on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "EntriesManager.h"
#import "Entry.h"

@interface EntriesManager()

@property (nonatomic, strong, readwrite) NSArray *entries;

@end


@implementation EntriesManager
- (NSArray*)entries {
    if (!_entries) { _entries = @[]; }
    return _entries;
}


- (void)add:(Entry *)entry {
    NSMutableArray *tempArray = [self.entries mutableCopy];
    [tempArray addObject:entry];
    self.entries = [tempArray copy];
}

- (void)remove:(Entry *)entry {
    NSMutableArray *tempArray = [self.entries mutableCopy];
    [tempArray removeObject:entry];
    self.entries = [tempArray copy];
}

@end