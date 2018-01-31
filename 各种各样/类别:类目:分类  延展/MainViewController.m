//
//  MainViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/20.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *name = [NSString stringWithFormat:@"使用runtime给类别添加属性"];
    name.NameStr = @"梨花";
    [name pushName:@"梨花"];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
