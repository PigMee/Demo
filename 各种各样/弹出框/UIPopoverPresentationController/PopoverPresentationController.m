//
//  PopoverPresentationController.m
//  各种各样
//
//  Created by 董磊 on 2017/12/22.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "PopoverPresentationController.h"

#import "ButtonPopoverViewController.h"

#import "ItemViewController.h"

@interface PopoverPresentationController ()<UIPopoverPresentationControllerDelegate>{
    UIBarButtonItem *rightBaritem;
}

@end

@implementation PopoverPresentationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //创建一个按钮
    UIButton *button = [[UIButton alloc]initWithFrame: CGRectMake(100, 100, 100, 50)];
    [button addTarget:self action:@selector(pop:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor blackColor];
    [self.view addSubview:button];
    
    rightBaritem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(click:)];
    self.navigationItem.rightBarButtonItem = rightBaritem;
}


//点击按钮出现的弹窗
-(void)pop:(UIButton *)sender{
 
    ButtonPopoverViewController *controller = [[ButtonPopoverViewController alloc] init];
    //出现弹窗的大小
    controller.preferredContentSize = CGSizeMake(120, 200);
    //模态弹出的样式
    controller.modalPresentationStyle = UIModalPresentationPopover;
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    //设置弹窗所依附的空间
    popController.sourceView = sender;
    //设置弹窗所依附空间的参考位置
    popController.sourceRect = sender.bounds;
//    popController.sourceRect = CGRectMake(10, 10, 20, 20);
    //设置箭头方向
    popController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    
    popController.delegate = self;
    
    [self presentViewController:controller animated:YES completion:nil];
    
}


-(void)click:(UIBarButtonItem *)sender{
    ItemViewController *controller = [[ItemViewController alloc] init];
    controller.preferredContentSize = CGSizeMake(100, 100); // 设置popover出来的视图的大小
    controller.modalPresentationStyle = UIModalPresentationPopover;
    
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.delegate = self;
    popController.barButtonItem = rightBaritem;
    [self presentViewController:controller animated:YES completion:nil];
}

// 设立实现代理，注意要返回UIModalPresentationNone
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

//将要弹出的时候调用
-(void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController{
    
}
//在这个方法中设置是否允许消失  默认为NO
-(BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    
    return YES;
    
}
//已经消失的时候调用
-(void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    
}
//用到其他UIView或者CGRect的时候调用
-(void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView *__autoreleasing _Nonnull *)view{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
