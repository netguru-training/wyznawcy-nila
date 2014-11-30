//
//  entry.m
//  bash
//
//  Created by Rafał Gawlik on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "Entry.h"

@interface Entry()

@property (nonatomic, strong, readwrite) NSString *user;
@property (nonatomic, strong, readwrite) NSString *body;
@property (nonatomic, assign, readwrite) NSInteger score;

@end


@implementation Entry

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [self initWithBody: [attributes valueForKeyPath:@"user"] user:[attributes valueForKeyPath:@"body"] score:[[attributes valueForKey:@"score"] integerValue]];
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
