//
//  NSObject+YPDynamic.m
//  YPRouter
//
//  Created by Apple on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "NSObject+YPDynamic.h"
#import <objc/runtime.h>

static char URLparams;

@implementation NSObject (YPDynamic)

-(NSDictionary*)dicParam{
    
    return objc_getAssociatedObject(self, &URLparams);
    
}

-(void)setDicParam:(NSDictionary *)dicParam{
    objc_setAssociatedObject(self, &URLparams,
                             dicParam,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (BOOL)dynamicCheckIsExistClassWithviewController:(NSString *)viewController{
    
    
    NSString *classStr = [NSString stringWithFormat:@"%@",viewController];
    const char *className = [classStr cStringUsingEncoding:NSASCIIStringEncoding];
    
    Class newClass = objc_getClass(className);
    if (newClass == nil) {
        
        // 进入该判断,表示该project里面，没有该类
        Class superClass = [NSObject class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        objc_registerClassPair(newClass);
//        @throw [NSException exceptionWithName:@"路由错误" reason:@"没有该类" userInfo:nil];
        return NO;
    }
    
    return YES;
}


- (void)dynamicDeliverWithViewController:(UIViewController *)viewController
                                     dic:(NSDictionary *)dic{
    // 处理传递数据
    if (dic != nil) {
        
        //单独把对象整体给控制器
        [viewController setDicParam:dic];

    }
}

@end
