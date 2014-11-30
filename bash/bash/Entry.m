#import "Entry.h"

@interface Entry()

@property (nonatomic, strong, readwrite) NSString *user;
@property (nonatomic, strong, readwrite) NSString *body;

@end


@implementation Entry

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [self initWithBody: [attributes valueForKeyPath:@"user"] user:[attributes valueForKeyPath:@"body"]];
    return self;
}

- (instancetype)initWithBody:(NSString *)body user:(NSString *)user{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.user = user;
    self.body = body;
    return self;
}

@end
