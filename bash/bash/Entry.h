#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, strong, readonly) NSString *user;
@property (nonatomic, strong, readonly) NSString *body;
@property (nonatomic, assign, readonly) NSInteger score;
@property (nonatomic, assign, readwrite) NSInteger entryId;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
- (instancetype)initWithBody:(NSString *) body user:(NSString *) user score:(NSInteger) score;
- (instancetype)upvote;
- (instancetype)downvote;
@end