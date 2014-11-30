#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, strong, readonly) NSString *user;
@property (nonatomic, strong, readonly) NSString *body;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
- (instancetype)initWithBody:(NSString *) body user:(NSString *) user;
@end