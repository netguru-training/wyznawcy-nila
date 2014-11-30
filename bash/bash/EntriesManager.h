#import <Foundation/Foundation.h>

@class Entry;
@interface EntriesManager : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

- (void)add:(Entry *)attributes;

@end
