//
//  YPRouter.m
//  YPRouter
//
//  Created by Apple on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YPRouter.h"
#import "YPRouterManager.h"

@interface YPRouter ()

@property (nonatomic , strong) NSMutableArray<id<YPRouterRole>> *rules; //规则集合

@end

@implementation YPRouter


+ (instancetype) router{
    static YPRouter *_instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [[YPRouter alloc] init];
    });
    
    return _instance;
}


#pragma mark - 检测url合法性
+ (BOOL)checkUrl:(NSString *)url{
    if(!url){
        NSLog(@"协议“%@”不合法!",url);
        return NO;
    }
//    if(![url hasPrefix:[YPRouter router].protocolHead]){
//        NSLog(@"协议“%@”不合法!",url);
//        return NO;
//    }
    NSLog(@"go:“%@”",url);
    return YES;
}

#pragma mark - 添加规则
- (void) addRule:(id<YPRouterRole>)rule{
    if(!_rules){
        _rules = [NSMutableArray array];
    }
    if(rule){
        [_rules addObject:rule];
    }
}

- (YPProtocol *)goVC:(NSString *)url{
    return [self goVC:url withCallBack:nil isPush:YES];
}

- (YPProtocol *)goVC:(NSString *)url withCallBack:(id)callBack{
    return [self goVC:url withCallBack:callBack isPush:YES];
}

- (YPProtocol *)goVC:(NSString *)url withCallBack:(id)callBack isPush:(BOOL)isPush{
    url = [NSString stringWithFormat:@"%@",url];
    if([YPRouter checkUrl:url]){
        YPProtocol *protocol = [[YPProtocol alloc]initWithInnerUrl:url];
        protocol.isPush = isPush;
        protocol.actionType = YPProtocolActionTypeUrl;
        protocol.callBack = callBack;
        [self redirect:protocol];
        return protocol;
    }
    return nil;
}

- (void)goProtocol:(YPProtocol *_Nullable)protocol{
    [self goProtocol:protocol withCallBack:nil isPush:YES];
}

- (void)goProtocol:(YPProtocol *_Nullable)protocol withCallBack:(id _Nullable)callBack{
    [self goProtocol:protocol withCallBack:callBack isPush:YES];
}

- (void)goProtocol:(YPProtocol *)protocol withCallBack:(id)callBack isPush:(BOOL)isPush{
    protocol.isPush = isPush;
    protocol.actionType = YPProtocolActionTypeUrl;
    protocol.callBack = callBack;
    [self redirect:protocol];
}

- (void)redirect:(YPProtocol *)protocol{
    __block id<YPRouterRole> existedRole = nil;
    for(id<YPRouterRole> role in _rules){
        if([role respondsToSelector:@selector(targets)]){
            NSArray *targets = [role targets];
            [targets enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSString *target = (NSString *)obj;
                if([target isEqualToString:protocol.target]){
                    *stop = true;
                    existedRole = role;
                }
            }];
        }
        if(existedRole && [existedRole respondsToSelector:@selector(redirect:)]){
            [existedRole redirect:protocol];
            return;
        }
    }
    if (protocol.isPush) {
        [[YPRouterManager router] push:protocol.target
                              animated:YES
                             paramsDic:protocol.params
                isHiddenTabbarWhenPush:YES
                            completion:nil];
    }else{
        [[YPRouterManager router] present:protocol.target
                                 animated:YES
                                paramsDic:protocol.params
                               completion:nil];
    }
}

@end
