//
//  ViewController.m
//  YPRouter
//
//  Created by yaopeng on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "YPRouterManager.h"
#import "YPRouter.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第一个页面";
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 80, 40);
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}


-(void)nextAction{
    
    NSDictionary *dic = @{
                          @"url":@"http://baidu.com",
                          @"name":@"yaop",
                          @"sex":@"男",
                          @"address":@"hangzhou"
                          };
    [[YPRouterManager router]push:@"YPNextViewController" animated:YES paramsDic:dic isHiddenTabbarWhenPush:YES completion:nil];
    
    //如果是协议跳转处理 注册协议 然后转化成相应的类名作跳转传值处理
    //通过指定协议或者URL 进行页面跳转。 需要把协议各个字段拆开，放倒字典中，然后进行调整传值。
    //此协议直接
//    [[YPRouter router]goVC:@"web?aa=1&bb=2&cc=3" withCallBack:nil isPush:YES];
    
}


//接受上个页面返回的值
-(void)yp_receivePreviousControllerWithParamsDic:(NSDictionary *)ParamsDic{
    
    NSLog(@"----%@-----",ParamsDic);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
