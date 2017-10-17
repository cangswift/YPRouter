//
//  ZHLocalRouterRole.m
//  TenantWallet
//
//  Created by yaopeng on 2017/10/10.
//  Copyright © 2017年 fintechzh. All rights reserved.
//

#import "YPLocalRouterRole.h"
#import "YPProtocol.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "YPRouter.h"
#import "YPRouterManager.h"
#import "YPWebViewController.h"

@interface YPLocalRouterRole ()


@end

@implementation YPLocalRouterRole

#pragma mark - 必要实现
- (NSArray *) targets{
    return @[
             @"web",
             @"home"
             ];
}

- (void) redirect:(YPProtocol *)protocol{
    
    if(!protocol.target){
        NSLog(@"协议出错:协议目标为空!");
        return;
    }
    BOOL isExist = NO;
    for(NSString *target in [self targets]){
        if([target isEqualToString:protocol.target]){
            isExist = YES;
            break;
        }
    }
    if(!isExist){
        NSLog(@"协议出错:协议目标“%@”不存在!",protocol.target);
        return;
    }

#pragma mark - H5跳转
    if([@"web" isEqualToString:protocol.target]){
        NSString *url = [protocol.params objectForKey:@"url"];
        [self routerPushUrl:url withVoidback:nil withDicParams:protocol.params];
    }

}


#pragma mark - [push 方式跳转到相应控制器]
-(void)routerPushUrl:(NSString*)url withVoidback:(BOOL)voidback withDicParams:(NSDictionary*)params{
    YPWebViewController *vc = [[YPWebViewController alloc] init];
    vc.dicParam = params;
    [[self getCurrentVC].navigationController pushViewController:vc animated:YES];
}

/**
 *  得到当前显示的VC
 */
- (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    
    return result;
}



@end
