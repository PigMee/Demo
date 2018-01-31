//
//  NotifitionViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/28.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "NotifitionViewController.h"

@interface NotifitionViewController ()

@end

@implementation NotifitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doSomeThing:) name:@"CHANGECOLOR" object:nil];
}

-(void)doSomeThing:(NSNotification *)sender{
    NSLog(@"执行了通知的方法");
    NSLog(@"%@",sender.object);
    self.view.backgroundColor = [UIColor redColor];
}

/*发送通知在iOS关键字的视图控制器中写着*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    NSLog(@"这个界面被销毁了");
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:@"CHANGECOLOR"];
}



@end
