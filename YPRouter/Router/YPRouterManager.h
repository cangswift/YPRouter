//
//  YPRouterManager.h
//  YPRouter
//
//  Created by Apple on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+YPDynamic.h"
#import "UINavigationController+YPRouter.h"
#import "UIViewController+YPRouter.h"

@interface YPRouterManager : NSObject

@property(nonatomic,strong)UINavigationController *navigationController;


+ (instancetype)router;

#pragma mark - push、pop
/// push模式
- (void)push:(NSString *)viewController
    animated:(BOOL)animated;

- (void)push:(NSString *)viewController
    animated:(BOOL)animated
   paramsDic:(NSDictionary *)paramsDic;

- (void)push:(NSString *)viewController
    animated:(BOOL)animated
   paramsDic:(NSDictionary *)paramsDic
isHiddenTabbarWhenPush:(BOOL)isHiddenTabbarWhenPush;

- (void)push:(NSString *)viewController
    animated:(BOOL)animated
   paramsDic:(NSDictionary *)paramsDic
isHiddenTabbarWhenPush:(BOOL)isHiddenTabbarWhenPush
  completion:(void(^)(void))completion;

/// pop模式
- (void)popViewControllerAnimated:(BOOL)animated;

- (void)popViewControllerAnimated:(BOOL)animated
                        paramsDic:(NSDictionary *)paramsDic;

- (void)popViewControllerAnimated:(BOOL)animated
                        paramsDic:(NSDictionary *)paramsDic
                       completion:(void(^)(void))completion;

/// pop到指定vc
- (void)popToViewController:(NSString *)viewController
                   animated:(BOOL)animated;

- (void)popToViewController:(NSString *)viewController
                   animated:(BOOL)animated
                  paramsDic:(NSDictionary *)paramsDic;

- (void)popToViewController:(NSString *)viewController
                   animated:(BOOL)animated
                  paramsDic:(NSDictionary *)paramsDic
                 completion:(void(^)(void))completion;

/// popToRoot模式
- (void)popToRootViewControllerAnimated:(BOOL)animated;

- (void)popToRootViewControllerAnimated:(BOOL)animated
                              paramsDic:(NSDictionary *)paramsDic
                             completion:(void(^)(void))completion;

#pragma mark - present、dismiss
- (void)present:(NSString *)viewController
       animated:(BOOL)animated
      paramsDic:(NSDictionary *)paramsDic
     completion:(void(^)(void))completion;

@end
