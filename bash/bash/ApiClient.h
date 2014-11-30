#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface ApiClient : AFHTTPSessionManager
    + (instancetype)sharedClient;
@end
