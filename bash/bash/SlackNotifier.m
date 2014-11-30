//
//  SlackNotifier.m
//  bash
//
//  Created by Bartosz Kopiński on 30/11/14.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "SlackNotifier.h"
#import <AFNetworking/AFHTTPSessionManager.h>

NSString * const SlackEndpointHost = @"https://hooks.slack.com/";
NSString * const SlackEndpointPath = @"services/T0251EZGA/B033ACP9D/CbOQOMPLimH5y175foKCp1Kk";
NSString * const BackendEntriesURL = @"https://wyznawcy-nila.herokuapp.com/entries";
NSString * const SlackAvatarURL = @"https://avatars3.githubusercontent.com/u/57415?v=3&s=60";

@implementation SlackNotifier

- (BOOL)notifyNewEntry:(Entry *)entry {
    NSString *message = [NSString stringWithFormat:@"New quote: _%@..._ (<%@|more>)", entry.body, BackendEntriesURL];
    NSURL *hostURL = [NSURL URLWithString:SlackEndpointHost];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"Bash" forKey:@"username"];
    [parameters setObject:message forKey:@"text"];
    [parameters setObject:SlackAvatarURL forKey:@"icon_url"];

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:hostURL];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager POST:SlackEndpointPath
       parameters:parameters
          success:^(NSURLSessionDataTask *task, id responseObject) {

        NSLog(@"JSON: %@", responseObject);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error while sending POST"
                                                            message:@"Sorry, try again."
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
        NSLog(@"Error: %@", [error localizedDescription]);
    }];
    return YES;
}

@end
