//
//  PushViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/20.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController (){
    NSString *name;
    NSString *sex;
}

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    name = @"浪子彦";
    sex = @"男";
    
    
    //block保存代块 传值
    UIButton *sendValueBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCRWidth / 2 - 40, SCRHeight / 2 - 20, 80, 40)];
    [sendValueBtn setTitle:@"传值" forState:UIControlStateNormal];
    [sendValueBtn addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
    sendValueBtn.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:sendValueBtn];
    // Do any additional setup after loading the view.
}

-(void)sendAction:(UIButton *)sender{
    if (self.SendBlock) {
        self.SendBlock(name, sex);
    }
    if (self.bBlock) {
        
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)countBigNumberOne:(int)numberOne NumberTwo:(int)numberTwo BigOne:(aBlock)bigOne{
    if (!numberOne) {
        bigOne(numberTwo);
    }
    
    if (!numberTwo) {
        bigOne(numberOne);
    }
    
    if (!numberOne && !numberTwo) {
        NSLog(@"错误");
    }
    
    if (numberTwo && numberOne) {
     bigOne(numberOne > numberTwo ? numberOne:numberTwo);
    }
    
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
