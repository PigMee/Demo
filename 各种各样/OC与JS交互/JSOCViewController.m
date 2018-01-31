//
//  JSOCViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/23.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "JSOCViewController.h"
#import "OCcallJSViewController.h"
#import "JScallOCViewController.h"

@interface JSOCViewController ()


@end

@implementation JSOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *OCcallJSBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, SCRWidth - 60, 50)];
    [OCcallJSBtn addTarget:self action:@selector(OCcallJS) forControlEvents:UIControlEventTouchUpInside];
    OCcallJSBtn.backgroundColor = [UIColor cyanColor];
    [OCcallJSBtn setTitle:@"OC调用JS" forState:0];
    
    
    UIButton *JScallOCBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 180, SCRWidth - 60, 50)];
    [JScallOCBtn addTarget:self action:@selector(JScallOC) forControlEvents:UIControlEventTouchUpInside];
    JScallOCBtn.backgroundColor = [UIColor cyanColor];
    [JScallOCBtn setTitle:@"JS调用OC" forState:0];
    
    
    [self.view addSubview:OCcallJSBtn];
    [self.view addSubview:JScallOCBtn];

}

-(void)OCcallJS{
    OCcallJSViewController *ocvc = [[OCcallJSViewController alloc]init];
    [self.navigationController pushViewController:ocvc animated:YES];
    
}

-(void)JScallOC{
    JScallOCViewController *jsvc = [[JScallOCViewController alloc]init];
    [self.navigationController pushViewController:jsvc animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
