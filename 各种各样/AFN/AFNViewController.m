//
//  AFNViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/12/6.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "AFNViewController.h"
#import "netStateView.h"

@interface AFNViewController ()

@property (nonatomic,copy)NSString *NetState;

@end

@implementation AFNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"网络监听";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    

    [self setNetState];
    
    netStateView *netview = [netStateView shareStateView];
    netview.frame = CGRectMake(0, 64, SCRWidth, 50);
    [self.view addSubview:netview];
}

/*
 AFNetworkReachabilityStatusUnknown          = -1, //未知
 AFNetworkReachabilityStatusNotReachable     = 0,  //无连接
 AFNetworkReachabilityStatusReachableViaWWAN = 1,  //3G
 AFNetworkReachabilityStatusReachableViaWiFi = 2,  //WIFI
 */
-(void)setNetState{
    AFNetworkReachabilityManager *netManger = [AFNetworkReachabilityManager sharedManager];
    [netManger startMonitoring];
    [netManger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:{
                NSLog(@"未知网络");
                self.NetState = @"1";
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeNetState" object:_NetState];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"正在使用WiFi");
                self.NetState = @"2";
        
                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeNetState" object:_NetState];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"没有连接");
                self.NetState = @"3";
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeNetState" object:_NetState];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"正在使用流量");
                self.NetState = @"4";
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeNetState" object:_NetState];
            }
                
            
            default:
                break;
                
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
