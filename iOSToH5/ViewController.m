//
//  ViewController.m
//  iOSToH5
//
//  Created by Terra MacBook on 16/9/14.
//  Copyright © 2016年 JianbingZhou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    UIImagePickerController *imagePikcerController;
}
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate = self;
    [webView sizeToFit];
    [self.view addSubview:webView];
    self.webView = webView;

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test.html" withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,450, self.view.frame.size.width, 50)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"我是oc创建的btn,点我传参数给h5" forState:0];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick {
    
    [self.webView stringByEvaluatingJavaScriptFromString:@"userInfo('把是否登录的结果传过来了')"];
   
}

#pragma mark - webViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    
    
    return YES;
}




- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *js = @"document.title";
    // NSString *title =   [webView stringByEvaluatingJavaScriptFromString:js];
    
    js = @"document.body.clientWidth||window.innerWidth||document.documentElement.clientWidth";
    // NSString *widht =  [webView stringByEvaluatingJavaScriptFromString:js];
    js = @"document.body.clientHeight";
    NSString *height = [webView stringByEvaluatingJavaScriptFromString:js];
    NSLog(@"%@&&&&&&&&&&&:%@",NSStringFromCGRect(webView.frame),height);
}

@end
