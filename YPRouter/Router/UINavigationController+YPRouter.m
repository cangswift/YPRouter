//
//  UINavigationController+YPRouter.m
//  YPRouter
//
//  Created by Apple on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UINavigationController+YPRouter.h"

@implementation UINavigationController (YPRouter)

// push
- (void)yp_PushViewController:(UIViewController *)viewController
                     animated:(BOOL)animated
       isHiddenTabbarWhenPush:(BOOL)isHiddenTabbarWhenPush
                   completion:(void(^)(void))completion{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    viewController.hidesBottomBarWhenPushed = isHiddenTabbarWhenPush;
    [self pushViewController:viewController animated:animated];
    [CATransaction commit];
}


// pop回上一级
- (void)yp_popViewController:(BOOL)animated completion:(void (^)(void))completion{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self popViewControllerAnimated:animated];
    [CATransaction commit];
}

// pop到指定控制器
- (void)yp_popToViewController:(UIViewController *)viewController
                      animated:(BOOL)animated
                    completion:(void (^)(void))completion{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self popToViewController:viewController animated:animated];
    [CATransaction commit];
}

// popToRoot
- (void)yp_popToRootViewController:(BOOL)animated
                        completion:(void(^)(void))completion{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self popToRootViewControllerAnimated:animated];
    [CATransaction commit];
}
@end
