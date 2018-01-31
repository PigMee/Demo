//
//  JScallOCViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/23.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "JScallOCViewController.h"

@interface JScallOCViewController ()<UIWebViewDelegate,JSdelegate>

@property (nonatomic,strong)JSContext *context;
@property (nonatomic,strong)UIWebView *webview;

@end

@implementation JScallOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.context = [[JSContext alloc]init];
    
    self.webview = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    self.webview.delegate = self;
    [self.webview loadRequest:request];
    [self.view addSubview:_webview];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    //获取HTML节点--获取HTML的title赋值给导航条
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    
    // 以 JSExport 协议关联 native 的方法
    self.context[@"mali"] = self;
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
    
    
    // 以 block 形式关联 JavaScript function
    __block typeof(self) weakSelf = self;
    
    self.context[@"clickA"] = ^(NSString *str){
        NSArray *args = [JSContext currentArguments];
        NSLog(@"***%d***",[NSThread isMainThread]);
        //此时是在子线程中 如果有UI操作 需先返回主线程中
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.title = @"JS调用OC代码";
        });
    };
    
    self.context[@"ml_call"] = ^(NSString *str)
    {
        NSLog(@"%@", str);
        //下面写OC代码
        
        
        
        JSValue *Callback = weakSelf.context[@"Callback"];
        //传值给web端
        [Callback callWithArguments:@[@"block唤起本地OC回调完成"]];
    };
    
    
    
    //    __block typeof(self) weakSelf = self;
    self.context[@"ml_go_call"] = ^(NSString *str)
    {
        NSLog(@"%@", str);
        
        
        
        // 成功回调js的方法Callback
        JSValue *Callback = weakSelf.context[@"alerCallback"];
        [Callback callWithArguments:nil];
    };
}

- (void)call{
    NSLog(@"call");
    // 之后在回调js的方法Callback把内容传出去
    JSValue *Callback = self.context[@"Callback"];
    //传值给web端
    [Callback callWithArguments:@[@"delegate唤起本地OC回调完成"]];
}


- (void)getCall:(NSString *)callString{
    NSLog(@"Get:%@", callString);
    // 成功回调js的方法Callback
    JSValue *Callback = self.context[@"alerCallback"];
    [Callback callWithArguments:nil];
    
    //    直接添加提示框
    //    NSString *str = @"alert('OC添加JS提示成功')";
    //    [self.jsContext evaluateScript:str];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"error == %@",error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
