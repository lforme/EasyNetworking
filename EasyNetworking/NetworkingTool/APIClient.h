//
//  APIClient.h
//  DrinkingW
//
//  Created by 王宏洋 on 2016/12/22.
//  Copyright © 2016年 WHY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RequestMethod) {
  RequestMethodGET = 0,
  RequestMethodPOST,
};

@protocol RequestConstraint <NSObject>
@required
- (NSString *)apiAdress;
- (RequestMethod)methodName;
@optional
- (BOOL)shouldCache;
- (NSDictionary *)param;
@end


@interface APIClient : NSObject

///  Get the shared agent.
+ (APIClient *)shareClient;

///  Add request to session and start it.
- (RACSignal *)addRequest:(id<RequestConstraint>)request;




@end
NS_ASSUME_NONNULL_END
