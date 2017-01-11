//
//  AFHTTPSessionManager+SendTool.h
//  DrinkingW
//
//  Created by 王宏洋 on 2016/12/23.
//  Copyright © 2016年 WHY. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN
@interface AFHTTPSessionManager (SendTool)

- (RACSignal *)rac_dataTaskWithHTTPMethod:(NSString *)method
                                URLString:(NSString *)URLString
                               parameters:(id)parameters
                           uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                         downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress;

- (RACSignal *)rac_GET:(NSString *)URLString parameters:(nullable id)parameters
              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress;


- (RACSignal *)rac_HEAD:(NSString *)URLString parameters:(nullable id)parameters;


- (RACSignal *)rac_POST:(NSString *)URLString parameters:(nullable id)parameters
               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress;


- (RACSignal *)rac_POST:(NSString *)URLString parameters:(nullable id)parameters
constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress;


- (RACSignal *)rac_PUT:(NSString *)URLString parameters:(nullable id)parameters;


- (RACSignal *)rac_PATCH:(NSString *)URLString parameters:(nullable id)parameters;


- (RACSignal *)rac_DELETE:(NSString *)URLString parameters:(nullable id)parameters;

@end
NS_ASSUME_NONNULL_END
