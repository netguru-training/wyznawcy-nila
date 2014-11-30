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