//
//  NSObject+YPDynamic.h
//  YPRouter
//
//  Created by Apple on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YPDynamic)

/** 跳转后控制器能拿到的参数*/
@property(nonatomic,strong) NSDictionary *dicParam;

// 检测，project中是否含有viewController类
- (BOOL)dynamicCheckIsExistClassWithviewController:(NSString *)viewController;

// 传递数据
- (void)dynamicDeliverWithViewController:(UIViewController *)viewController
                                     dic:(NSDictionary *)dic;


NS_ASSUME_NONNULL_END
@end
