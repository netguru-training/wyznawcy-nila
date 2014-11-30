#import <Foundation/Foundation.h>

@class Entry;
@interface EntriesManager : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

- (NSURLSessionDataTask *)fetch:(void (^)(NSArray *posts, NSError *error))block;
- (void)add:(Entry *)attributes;
- (void)remove:(Entry *)entry;
- (void)removeAtIndex:(NSInteger)eIndex;

@end
