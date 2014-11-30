#import "Entry.h"

@interface Entry()

@property (nonatomic, strong, readwrite) NSString *user;
@property (nonatomic, strong, readwrite) NSString *body;
@property (nonatomic, assign, readwrite) NSInteger score;

@end


@implementation Entry

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    NSNumber *score = attributes[@"score"];
    if (!score || [score isKindOfClass:[NSNull class]]) {
        score = @0;
    }
    self = [self initWithBody:attributes[@"body"]
                         user:attributes[@"user_name"]
                        score:[score integerValue]];
    return self;
}

- (instancetype)initWithBody:(NSString *)body user:(NSString *)user score:(NSInteger)score{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.user = user;
    self.body = body;
    return self;
}

- (instancetype)upvote {
    self.score += 1;
    return self;
}

- (instancetype)downvote {
    self.score -= 1;
    return self;
}

@end
