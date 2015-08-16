//
//  LBTouchID.m
//  TouchIDDemo
//
//  Created by luohuichao on 15/8/14.
//  Copyright (c) 2015年 luobbe. All rights reserved.
//

#import "LBTouchID.h"

#define CurrentIOS8            [[[UIDevice currentDevice] systemVersion] floatValue] >= 8

@implementation LBTouchID

+ (BOOL)checkTouchIDUsable
{
    if (!(CurrentIOS8)) {
        return NO;
    }
    LAContext *context = [[LAContext alloc] init];
    NSError *error;
    BOOL usable = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    return usable;
}

+ (void)verifyTouchIdWithLocalizedFallbackTitle:(NSString *)fallbackTitle
                                       callBack:(void (^)(BOOL result, NSError *error))block
{
    if (![LBTouchID checkTouchIDUsable]) {
        //Touch 不可用；
        return;
    }
    LAContext *context = [[LAContext alloc] init];
    context.localizedFallbackTitle = fallbackTitle;
    /**
     关于 context.maxBiometryFailures  建议不设置，默认的是3次，超过3次验证，就要重新验证，超过5次验证就要输入系统密码
     */
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请验证已有指纹" reply:^(BOOL success, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            block(success,error);
        });
    }];
}

@end
