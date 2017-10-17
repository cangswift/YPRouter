//
//  UIViewController+YPRouter.h
//  YPRouter
//
//  Created by Apple on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YPRouter)

/**
 present跳转控制器
 
 @param viewController 目标控制器
 @param animated 是否显示动画
 @param completion 完成回调
 */

- (void)yp_presentViewController:(UIViewController *)viewController
                        animated:(BOOL)animated
                      completion:(void (^)(void))completion;


/**
 dismiss返回上级控制器
 
 @param animated 是否显示动画
 @param completion 完成回调
 */
- (void)yp_dismissViewControllerAnimated:(BOOL)animated
                              completion:(void (^)(void))completion;

/**
dismiss到第一个present的控制器
 
 @param animated 是否显示动画
 @param completion 完成回调
 */
- (void)yp_dismissToRootViewControllerAnimated:(BOOL)animated
                                    completion:(void (^)(void))completion;

/**
接受pop、dismiss回传的值
 */
- (void)yp_receivePreviousControllerWithParamsDic:(NSDictionary *)ParamsDic;

@end
