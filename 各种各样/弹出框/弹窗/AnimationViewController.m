//
//  AnimationViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/22.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "AnimationViewController.h"
#import "GroundView.h"
#import "BottomView.h"
#import "PopoverPresentationController.h"


@interface AnimationViewController ()<DismissDelegete>{
    GroundView *groundView;
    
    BottomView *botView;
    
    
}


@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //初始化背景View
    [self initWithBigGroundView];
    
    //初始化从底部的弹出框
    [self initWithBottomView];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    groundView.alpahView.hidden = YES;
    [UIView animateWithDuration:0.35 animations:^{
        botView.frame = CGRectMake(0, SCRHeight, SCRWidth, SCRHeight);
    }];
}

-(void)initWithBigGroundView{
    groundView = [[GroundView alloc]initWithFrame:CGRectMake(0, 64, SCRWidth, SCRHeight - 64)];
    groundView.alpahView.hidden = YES;
    [self.view addSubview:groundView];
    
    [groundView.showBtn addTarget:self action:@selector(showBottom) forControlEvents:UIControlEventTouchUpInside];
    
    groundView.delegate = self;
    
}


-(void)initWithBottomView{
    botView = [[BottomView alloc]initWithFrame:CGRectMake(0, SCRHeight, SCRWidth, SCRHeight / 2)];
    [self.view addSubview:botView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)showBottom{
    groundView.alpahView.hidden = NO;
    groundView.alpahView.userInteractionEnabled = YES;
    
    [UIView animateWithDuration:0.35 animations:^{
        botView.frame = CGRectMake(0, SCRHeight / 2, SCRWidth, SCRHeight / 2);
    }];
    
    
    
}

-(void)disMiss{
    groundView.alpahView.hidden = YES;
    
    [UIView animateWithDuration:0.35 animations:^{
        botView.frame = CGRectMake(0, SCRHeight, SCRWidth, SCRHeight);
    }];
    
    
    PopoverPresentationController *pop = [[PopoverPresentationController alloc]init];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:pop animated:YES];
    });
}







@end
