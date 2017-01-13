//
//  BaseRequset.h
//  DrinkingW
//
//  Created by 王宏洋 on 2016/12/23.
//  Copyright © 2016年 WHY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "APIClient.h"



@interface BaseRequset : NSObject<RequestConstraint>
@property (nonatomic, strong, readonly) NSDate *createdTime;

- (RequestMethod)methodName;

- (NSString *)apiAdress;

- (NSDictionary *)param;

- (RACSignal *)start;

// cache timeout
- (NSInteger)cacheTimeInSeconds;

@end
