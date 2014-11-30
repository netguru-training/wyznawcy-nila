#import "EntriesManager.h"
#import "Entry.h"
#import "ApiClient.h"
#import "SlackNotifier.h"

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
    [[[SlackNotifier alloc] init] notifyNewEntry:entry];
    self.entries = [tempArray copy];
}

- (void)remove:(Entry *)entry {
    NSUInteger index = [self.entries indexOfObject:entry];
    [self removeAtIndex:index];
}

- (void)removeAtIndex:(NSInteger)eIndex {
    NSMutableArray *tempArray = [self.entries mutableCopy];
    [tempArray removeObjectAtIndex:eIndex];
    self.entries = [tempArray copy];
}

- (NSURLSessionDataTask *)fetch:(void (^)(NSArray *entries, NSError *error))block {
    return [[ApiClient sharedClient] GET:@"/entries.json" parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *entriesFromResponse = JSON;
        NSMutableArray *mutableEntires = [NSMutableArray arrayWithCapacity:[entriesFromResponse count]];
        for (NSDictionary *attributes in entriesFromResponse) {
            Entry *entry = [[Entry alloc] initWithAttributes:attributes];
            [mutableEntires addObject:entry];
        }
        self.entries = [NSArray arrayWithArray:mutableEntires];
        
        if (block) {
            block(self.entries, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end