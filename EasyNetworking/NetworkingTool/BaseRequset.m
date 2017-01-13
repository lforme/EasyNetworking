//
//  BaseRequset.m
//  DrinkingW
//
//  Created by 王宏洋 on 2016/12/23.
//  Copyright © 2016年 WHY. All rights reserved.
//

#import "BaseRequset.h"
@interface BaseRequset ()
@property (nonatomic, strong, readwrite) NSDate *createdTime;
@end

@implementation BaseRequset

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.createdTime = [NSDate date];
  }
  return self;
}

- (NSString *)apiAdress {
  return @"";
}

- (RequestMethod)methodName {
  return RequestMethodGET;
}

- (BOOL)shouldCache {
  return NO;
}

- (NSDictionary *)param {
  return @{};
}


- (RACSignal *)start {
  return [[APIClient shareClient] addRequest:self];
}

- (NSInteger)cacheTimeInSeconds {
  return -1;
}

- (NSDate *)createdTime {
  
  return _createdTime;
}

@end

//////////////////////////////////////////////////////


