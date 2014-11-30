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
                        score:[score integerValue]
                      entryId:[attributes[@"id"] integerValue]
            
            ];
    return self;
}

- (instancetype)initWithBody:(NSString *)body
                        user:(NSString *)user
                       score:(NSInteger)score
                     entryId:(NSInteger)entryId
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.user = user;
    self.body = body;
    self.score = score;
    self.entryId = entryId;
    return self;
}

- (instancetype)upvote {

    NSString *a = [NSString stringWithFormat:@"%li", (long)self.entryId];
    NSLog(a);
    return self;
}

- (instancetype)downvote {
    self.score -= 1;
    return self;
}

@end
