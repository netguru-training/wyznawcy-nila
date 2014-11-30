#import "Entry.h"
#import "ApiClient.h"

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
    self.score += 1;

    NSDictionary *parameters = @{@"entry": @{@"score": @1}};
    NSString *endpoint = [NSString stringWithFormat:@"/entries/%lu.json", self.entryId];

    [[ApiClient sharedClient] PUT:endpoint parameters:parameters success:nil failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        NSLog(@"%@", error);
    }];

    return self;
}

- (instancetype)downvote {
    self.score -= 1;

    NSDictionary *parameters = @{@"entry": @{@"score": @-1}};
    NSString *endpoint = [NSString stringWithFormat:@"/entries/%lu.json", self.entryId];

    [[ApiClient sharedClient] PUT:endpoint parameters:parameters success:nil failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        NSLog(@"%@", error);
    }];

    return self;
}

@end
