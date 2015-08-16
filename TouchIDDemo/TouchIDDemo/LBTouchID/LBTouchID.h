//
//  LBTouchID.h
//  TouchIDDemo
//
//  Created by luohuichao on 15/8/14.
//  Copyright (c) 2015年 luobbe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>

@interface LBTouchID : NSObject

+ (BOOL)checkTouchIDUsable;/**检测TouchID是否可用*/

/**
 *  验证Touch id
 *
 *  @param fallbackTitle 验证失败之后Alert的第二个按钮的标题
 *  @param block         验证的回调
 */
+ (void)verifyTouchIdWithLocalizedFallbackTitle:(NSString *)fallbackTitle
                                       callBack:(void (^)(BOOL result, NSError *error))block;/**验证Touch id*/

@end
