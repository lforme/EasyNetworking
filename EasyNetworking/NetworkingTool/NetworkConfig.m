//
//  NetworkConfig.m
//  DrinkingW
//
//  Created by 王宏洋 on 2016/12/23.
//  Copyright © 2016年 WHY. All rights reserved.
//

#import "NetworkConfig.h"

@implementation NetworkConfig
- (instancetype)init
{
  self = [super init];
  if (self) {
    _baseUrl = @"";
    _cdnUrl = @"";
    _sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
  }
  return self;
}

+ (NetworkConfig *)sharedConfig {
  static id sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self alloc] init];
  });
  return sharedInstance;
}

- (void)useCookies:(BOOL)use {
  [self.sessionConfiguration setHTTPCookieStorage:[NSHTTPCookieStorage sharedHTTPCookieStorage]];
  [self.sessionConfiguration setHTTPShouldSetCookies:use];
}
@end
