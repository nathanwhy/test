//
//  ViewController.m
//  mycode
//
//  Created by DOIT on 14-9-4.
//  Copyright (c) 2014年 nathanwu. All rights reserved.
//

#import "ViewController.h"
#import "headImage.h"
#import "VWWWaterView.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addLineLabel];
}


#pragma mark - 加下划线的文字
- (void)addLineLabel
{
    NSString *headtxt_first = @"欢迎登陆";
    NSString *headtxt_middle = @"酒店预定系统";
    NSString *headtxt_last = @"预定特惠酒店。";
    
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(20,80,280,200)];
    [self.view addSubview:webview];
    [webview.scrollView setScrollEnabled:NO];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    [webview loadHTMLString:[NSString stringWithFormat:@"<html><head><style type=\"text/css\">body {font-family: \"宋体\"; font-size:15px; color:#cfd3d8;background-color:#33353a}a{color:#EE7621;text-decoration:underline;}</style></head><body></body>%@<a href=\"checkbox\">%@</a>%@",headtxt_first, headtxt_middle, headtxt_last] baseURL:baseURL];
    webview.delegate = self;
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request URL]) {
        NSString *url = [NSString stringWithFormat:@"%@",[request URL]];
        if ([url hasSuffix:@"checkbox"]) {
            
            NSLog(@"实现按钮点击");
        }
    }
    return YES;
}






@end
