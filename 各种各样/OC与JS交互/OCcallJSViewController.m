//
//  OCcallJSViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/23.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "OCcallJSViewController.h"

@interface OCcallJSViewController (){
    NSNumber *a;
    NSNumber *b;
    UIButton *countBtn;
}

@end

@implementation OCcallJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"OC调用JS代码";
    self.view.backgroundColor = [UIColor brownColor];
    a = @2;
    b = @9;
    
    countBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, SCRWidth - 60, 50)];
    countBtn.backgroundColor = [UIColor blackColor];
    [countBtn addTarget:self action:@selector(OCcallJS) forControlEvents:UIControlEventTouchUpInside];
    [countBtn setTitle:@"2和9谁大" forState:UIControlStateNormal];
    [self.view addSubview:countBtn];
    
    //处理JS
    self.context = [[JSContext alloc]init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"js"];
     NSString *jsStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [self.context evaluateScript:jsStr];
}


-(void)OCcallJS{
    JSValue *function = [self.context objectForKeyedSubscript:@"AddCount"];
    JSValue *result = [function callWithArguments:@[a,b]];
    [countBtn setTitle:[NSString stringWithFormat:@"%@",[result toString]] forState:UIControlStateNormal];
    NSLog(@"%@",result);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}


@end
