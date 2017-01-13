//
//  APIClient.m
//  DrinkingW
//
//  Created by 王宏洋 on 2016/12/22.
//  Copyright © 2016年 WHY. All rights reserved.
//

#import "APIClient.h"
#import <pthread/pthread.h>
#import "AFHTTPSessionManager+SendTool.h"
#import "NetworkConfig.h"
#import <CommonCrypto/CommonDigest.h>
#import "CacheMetadata.h"
#define Lock() pthread_mutex_lock(&_lock)
#define Unlock() pthread_mutex_unlock(&_lock)

@interface APIClient()
{
  AFHTTPSessionManager *_manager;
  pthread_mutex_t _lock;
  NSMutableDictionary *_dispatchTable;
  id<RequestConstraint> _requset;
  CacheMetadata *_cacheMetadata;
  NSData *_cacheData;
  NSString *_cacheString;
}
@end

@implementation APIClient

+ (APIClient *)shareClient {
  static id sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self alloc] init];
  });
  return sharedInstance;
}

- (instancetype)init {
  if (self = [super init]) {
    _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[NetworkConfig sharedConfig].baseUrl] sessionConfiguration:[NetworkConfig sharedConfig].sessionConfiguration];
    _manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    _dispatchTable = [NSMutableDictionary dictionary];
    pthread_mutex_init(&_lock, NULL);
  }
  return self;
}

- (RACSignal *)addRequest:(id<RequestConstraint>)request {
  self->_requset = request;
  switch ([request methodName]) {
    case RequestMethodGET:
    {
      NSDate *cacheTime = [NSDate dateWithTimeInterval:[request cacheTimeInSeconds] sinceDate:[request createdTime]];
      NSDate *invalidTime = [NSDate date];
      BOOL cacheInvalid = cacheTime.timeIntervalSinceReferenceDate < invalidTime.timeIntervalSinceReferenceDate;
      if ([request shouldCache] && !cacheInvalid) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@%@", [request apiAdress], [request param]]]) {
          return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSString *jsonString = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@%@", [request apiAdress], [request param]]];
            NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];  //解析
            [subscriber sendNext: resultDic];
            [subscriber sendCompleted];
            return [RACDisposable new];
          }];
        }
      }
      
       return [[self->_manager rac_GET:[request apiAdress] parameters:[request param] progress:nil] doNext:^(id  _Nullable x) {
         NSData *metaData = [NSJSONSerialization dataWithJSONObject:x options:0 error:NULL];
         NSString *jsonString = [[NSString alloc] initWithData:metaData encoding:NSUTF8StringEncoding];
         [[NSUserDefaults standardUserDefaults] setValue:jsonString forKey:[NSString stringWithFormat:@"%@%@", [request apiAdress], [request param]]];
        }];

    }
      break;
    case RequestMethodPOST:
    {
    return [self->_manager rac_POST:[request apiAdress] parameters:[request param] progress:nil];
    }
  }
}



@end
