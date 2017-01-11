//
//  NetworkConfig.h
//  DrinkingW
//
//  Created by 王宏洋 on 2016/12/23.
//  Copyright © 2016年 WHY. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NetworkConfig : NSObject
@property (nonatomic, strong) NSString *baseUrl;
///  Request CDN URL. Default is empty string.
@property (nonatomic, strong) NSString *cdnUrl;
@property (nonatomic, strong) NSURLSessionConfiguration* sessionConfiguration;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

///  Return a shared config object.
+ (NetworkConfig *)sharedConfig;

- (void)useCookies:(BOOL)use;


@end
NS_ASSUME_NONNULL_END
