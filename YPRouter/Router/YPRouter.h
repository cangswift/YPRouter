//
//  NSObject+YPDynamic.m
//  YPRouter
//
//  Created by Apple on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "YPProtocol.h"


/**路由规则代理*/
@protocol YPRouterRole <NSObject>

@required
/**执行规则*/
- (void)redirect:(YPProtocol *)protocol;
/**目标集合*/
- (NSArray *)targets;

@end

/**路由调度*/
@interface YPRouter : NSObject


/**获取单例*/
+ (instancetype)router;

/**协议头*/
@property (nonatomic , copy) NSString *protocolHead;

/**协议加解密Key*/
@property (nonatomic , copy) NSString *protocolEncodeKey;


/**检测协议合法性*/
+ (BOOL) checkUrl:(NSString *)url;

/**添加路由规则*/
- (void) addRule:(id<YPRouterRole>)rule;

//内部控制器操作方法
- (YPProtocol *)goVC:(NSString *)url;
- (YPProtocol *)goVC:(NSString *)url withCallBack:(id)callBack;
- (YPProtocol *)goVC:(NSString *)url withCallBack:(id)callBack isPush:(BOOL)isPush;

//协议对象操作方法
- (void)goProtocol:(YPProtocol *)protocol;
- (void)goProtocol:(YPProtocol *)protocol withCallBack:(id)callBack;
- (void)goProtocol:(YPProtocol *)protocol withCallBack:(id)callBack isPush:(BOOL)isPush;

@end
