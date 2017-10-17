//
//  YPWebViewController.m
//  YPRouter
//
//  Created by yaopeng on 2017/10/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YPWebViewController.h"
#import "YPRouter.h"
#import "YPRouterManager.h"
@interface YPWebViewController ()<UIWebViewDelegate>

@property (nonatomic , strong) UIWebView *baseView;
@property (nonatomic , copy) NSString *url;
@end

@implementation YPWebViewController


- (void)dealloc{
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initRootView];
 
}

- (void)initRootView{
    self.title = @"web";
    _baseView = [UIWebView new];
    _baseView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    NSString *url = self.dicParam[@"url"];
    NSLog(@"========%@=========",self.dicParam);

    [_baseView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [self.view addSubview:_baseView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 80, 40);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *urlString = [[request URL] absoluteString];
    urlString = [urlString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if ([YPRouter checkUrl:urlString]) {
        YPProtocol *protocol = [[YPProtocol alloc]initWithOutUrl:urlString];
        [[YPRouter router] goProtocol:protocol withCallBack:nil];
        return NO;
    }
    
    NSMutableURLRequest *mutableRequest = (NSMutableURLRequest *)request;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.dicParam options:NSJSONWritingPrettyPrinted error:nil];
    
    [mutableRequest setHTTPBody: jsonData];
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

-(void)backAction{
    
    [[YPRouterManager router]popViewControllerAnimated:YES paramsDic:self.dicParam];
    
}



@end
