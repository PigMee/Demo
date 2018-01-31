//
//  MainBlockViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/20.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "MainBlockViewController.h"
#import "PushViewController.h"

@interface MainBlockViewController ()
@property (nonatomic,strong)UILabel *textLab;

@end

@implementation MainBlockViewController

/*
 __block在MRC下有两个作用
 1. 允许在Block中访问和修改局部变量
 2. 禁止Block对所引用的对象进行隐式retain操作
 
 __block在ARC下只有一个作用
 1. 允许在Block中访问和修改局部变量
 
 在ARC下使用block
 1.在ARC默认情况下,Block的内存存储在堆中,ARC会自动进行内存管理,程序员只需要避免循环引用即可
 2.在Block的内存存储在堆中时,如果在Block中引用了外面的对象,会对所引用的对象进行强引用,但是在Block被释放时会自动去掉对该对象的强引用,所以不会造成内存泄漏
 
 3.如果对象内部有一个Block属性,而在Block内部又访问了该对象,那么会造成循环引用
 
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(pushAction:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.textLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, SCRWidth, SCRHeight)];
    [self.view addSubview:_textLab];

}

-(void)pushAction:(UIBarButtonItem *)sender{
    int a = 7;
    int b = 4;
    
    //block保存代码块
    PushViewController *pushVC = [[PushViewController alloc]init];
    pushVC.SendBlock = ^(NSString *namestr, NSString *sexstr) {
        _textLab.text = [NSString stringWithFormat:@"%@,%@",namestr,sexstr];
        NSLog(@"%@,%@",namestr,sexstr);
    };
    
    //block作为函数参数
    [pushVC countBigNumberOne:a NumberTwo:b BigOne:^(int c) {
        NSLog(@"计算的最大值是%d",c);
    }];
    
    [self.navigationController pushViewController:pushVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
