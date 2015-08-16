//
//  ViewController.m
//  TouchIDDemo
//
//  Created by luobbe on 15/8/14.
//  Copyright (c) 2015年 luobbe.com All rights reserved.
//

#import "ViewController.h"
#import "LBTouchID.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchID:(id)sender {
    
    if (![LBTouchID checkTouchIDUsable]) {
        //次设备暂不支持TouchID
        return;
    }
    [LBTouchID verifyTouchIdWithLocalizedFallbackTitle:@"你好"
                                              callBack:^(BOOL result, NSError *error) {
                                                  //
                                                  if (result) {
                                                      NSLog(@"Touch ID 验证成功");
                                                  }else{
                                                      NSLog(@"Touch ID 验证失败，error:%@",error);
                                                  }
                                              }];
    
}


@end
