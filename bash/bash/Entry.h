//
//  entry.h
//  bash
//
//  Created by Rafał Gawlik on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, strong, readonly) NSString *user;
@property (nonatomic, strong, readonly) NSString *body;
@property (nonatomic, assign, readonly) NSInteger score;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
- (instancetype)initWithBody:(NSString *) body user:(NSString *) user score:(NSInteger) score;
@end