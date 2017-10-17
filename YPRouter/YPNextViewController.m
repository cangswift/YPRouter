//
//  YPNextViewController.m
//  YPRouter
//
//  Created by yaopeng on 2017/10/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YPNextViewController.h"
#import "NSObject+YPDynamic.h"
#import "YPRouterManager.h"


@interface YPNextViewController ()

@end

@implementation YPNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第二个页面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"========%@=========",self.dicParam);
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 80, 40);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}


-(void)backAction{
    
    [[YPRouterManager router]popViewControllerAnimated:YES paramsDic:self.dicParam];
  
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
