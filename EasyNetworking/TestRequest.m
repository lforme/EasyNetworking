//
//  TestRequest.m
//  NetworkingDemo
//
//  Created by MacFor_Eric_Liu on 2017/1/11.
//  Copyright © 2017年 MacFor_Eric_Liu. All rights reserved.
//

#import "TestRequest.h"

@implementation TestRequest
- (RequestMethod)methodName {
    return RequestMethodGET;
}

- (NSString *)apiAdress {
    return @"search/repositories";
}

- (NSDictionary *)param {
    return  @{@"q": @"language:javascript",
               @"sort": @"stars",
               @"order": @"desc"
               };
}

- (BOOL)shouldCache {
    return YES;
}

- (NSInteger)cacheTimeInSeconds {
  return 5;
}

@end
