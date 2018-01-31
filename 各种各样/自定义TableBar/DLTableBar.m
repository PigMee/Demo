//
//  DLTableBar.m
//  各种各样
//
//  Created by 董磊 on 2018/1/16.
//  Copyright © 2018年 董磊. All rights reserved.
//

#import "DLTableBar.h"
#import "ViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface DLTableBar ()
{
    NSArray *titles;
    NSArray *images;
    NSArray *selectedImages;
    NSArray *controllers;
}

@end

@implementation DLTableBar

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    // Do any additional setup after loading the view.
}

-(void)InitView{
    titles = [NSArray arrayWithObjects:@"主页",@"我的", nil];
    images = [NSArray arrayWithObjects:@"tabbar_home@3x", @"tabbar_reward@3x",@"tabbar_reward@3x",nil];
    selectedImages = [NSArray arrayWithObjects:@"tabbar_home_selected@3x", @"tabbar_reward_selected@3x",@"tabbar_home_selected@3x",nil];
    
    ViewController *oneVC = [[ViewController alloc]init];
    TwoViewController *twoVC = [[TwoViewController alloc]init];
    ThreeViewController *ThreeVC = [[ThreeViewController alloc]init];
    controllers = [NSArray arrayWithObjects:oneVC,twoVC,ThreeVC,nil];
    
    for (int i= 0; i < controllers.count; i ++) {
        UIViewController *childVC = controllers[i];
        [self setVC:childVC title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    };
}

- (void)setVC:(UIViewController *)VC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    VC.tabBarItem.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [VC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    VC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
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
