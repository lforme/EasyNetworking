//
//  BaseRequset.m
//  DrinkingW
//
//  Created by 王宏洋 on 2016/12/23.
//  Copyright © 2016年 WHY. All rights reserved.
//

#import "BaseRequset.h"

@implementation BaseRequset
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

@end

//////////////////////////////////////////////////////


