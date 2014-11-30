#import "ApiClient.h"

static NSString * const APIBaseURLString = @"https://wyznawcy-nila.herokuapp.com";

@implementation ApiClient

+ (instancetype)sharedClient {
    static ApiClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ApiClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
