//
//  UIViewController+YPRouter.m
//  YPRouter
//
//  Created by Apple on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIViewController+YPRouter.h"

@implementation UIViewController (YPRouter)



// present
- (void)yp_presentViewController:(UIViewController *)viewController
                        animated:(BOOL)animated
                      completion:(void (^)(void))completion{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self presentViewController:viewController animated:animated completion:completion];
    [CATransaction commit];
}


// dismiss
- (void)yp_dismissViewControllerAnimated:(BOOL)animated
                              completion:(void (^)(void))completion{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self dismissViewControllerAnimated:YES completion:nil];
    [CATransaction commit];
}

// dismiss到第一个present的控制器
- (void)yp_dismissToRootViewControllerAnimated:(BOOL)animated
                                    completion:(void (^)(void))completion{
    
    /**
     1、注意区分presentedViewController与presentingViewController
     2、通过present，A->B
     3、A.presentedViewController 是B
     4、B.presentingViewController 是A
     */
    
    UIViewController *vc = self;
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [vc dismissViewControllerAnimated:YES completion:nil];
    [CATransaction commit];
}

// 接受pop、dismiss回传的值
- (void)yp_receivePreviousControllerWithParamsDic:(NSDictionary *)ParamsDic{
    
}
@end
