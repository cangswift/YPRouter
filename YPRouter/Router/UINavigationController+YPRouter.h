//
//  UINavigationController+YPRouter.h
//  YPRouter
//
//  Created by Apple on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (YPRouter)

/**
 push跳转
 
 @param viewController 目标控制器
 @param animated 是否动画条状
 @param isHiddenTabbarWhenPush 是否隐藏tabbar
 @param completion 完成回调
 */
- (void)yp_PushViewController:(UIViewController *)viewController
                     animated:(BOOL)animated
       isHiddenTabbarWhenPush:(BOOL)isHiddenTabbarWhenPush
                   completion:(void(^)(void))completion;

/**
 push返回上级控制器
 
 @param animated 是否显示动画
 @param completion 完成回调
 */
- (void)yp_popViewController:(BOOL)animated
                  completion:(void (^)(void))completion;

/**
 push返回制定控制器
 
 @param viewController 目标控制器
 @param animated 是否显示动画
 @param completion 完成回调
 */
- (void)yp_popToViewController:(UIViewController *)viewController
                      animated:(BOOL)animated
                    completion:(void (^)(void))completion;


/**
 返回根控制器
 
 @param animated 是否显示动画
 @param completion 完成回调
 */
- (void)yp_popToRootViewController:(BOOL)animated
                        completion:(void(^)(void))completion;

@end
