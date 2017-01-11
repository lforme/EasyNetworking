//
//  CacheMetadata.m
//  DrinkingW
//
//  Created by 王宏洋 on 2016/12/24.
//  Copyright © 2016年 WHY. All rights reserved.
//

#import "CacheMetadata.h"

@implementation CacheMetadata

+ (BOOL)supportsSecureCoding {
  return YES;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeObject:@(self.version) forKey:NSStringFromSelector(@selector(version))];
  [aCoder encodeObject:self.sensitiveDataString forKey:NSStringFromSelector(@selector(sensitiveDataString))];
  [aCoder encodeObject:@(self.stringEncoding) forKey:NSStringFromSelector(@selector(stringEncoding))];
  [aCoder encodeObject:self.creationDate forKey:NSStringFromSelector(@selector(creationDate))];
  [aCoder encodeObject:self.appVersionString forKey:NSStringFromSelector(@selector(appVersionString))];
  [aCoder encodeObject:self.cacheRespones forKey:NSStringFromSelector(@selector(cacheRespones))];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [self init];
  if (!self) {
    return nil;
  }
  
  self.version = [[aDecoder decodeObjectOfClass:[NSNumber class] forKey:NSStringFromSelector(@selector(version))] integerValue];
  self.sensitiveDataString = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(sensitiveDataString))];
  self.stringEncoding = [[aDecoder decodeObjectOfClass:[NSNumber class] forKey:NSStringFromSelector(@selector(stringEncoding))] integerValue];
  self.creationDate = [aDecoder decodeObjectOfClass:[NSDate class] forKey:NSStringFromSelector(@selector(creationDate))];
  self.appVersionString = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(appVersionString))];
  self.cacheRespones = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(cacheRespones))];
  return self;
}

@end
