//
//  CacheMetadata.h
//  DrinkingW
//
//  Created by 王宏洋 on 2016/12/24.
//  Copyright © 2016年 WHY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheMetadata : NSObject<NSSecureCoding>
@property (nonatomic, assign) long long version;
@property (nonatomic, strong) NSString *sensitiveDataString;
@property (nonatomic, assign) NSStringEncoding stringEncoding;
@property (nonatomic, strong) NSDate *creationDate;
@property (nonatomic, strong) NSString *appVersionString;
@property (nonatomic, strong) id cacheRespones;
@end
