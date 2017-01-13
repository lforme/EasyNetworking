//
//  ViewController.m
//  EasyNetworking
//
//  Created by 王宏洋 on 2017/1/11.
//  Copyright © 2017年 WHY. All rights reserved.
//

#import "ViewController.h"
#import "TestRequest.h"
#import "NetworkConfig.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [NetworkConfig sharedConfig].baseUrl = @"https://api.github.com/";
  
  TestRequest *test = [[TestRequest alloc] init];
  
  [[test start] subscribeNext:^(id  _Nullable x) {
    NSLog(@"====%@", x);
  }];
  
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [[test start] subscribeNext:^(id  _Nullable x) {
      NSLog(@"====%@", x);
    }];

  });
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
