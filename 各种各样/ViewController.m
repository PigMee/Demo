//
//  ViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/12.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "ViewController.h"
#import "FMDBViewController.h"
#import "MainViewController.h"
#import "MainBlockViewController.h"
#import "AnimationViewController.h"
#import "JSOCViewController.h"
#import "KeyWordViewController.h"
#import "NotifitionViewController.h"
#import "ScrViewController.h"
#import "AFNViewController.h"
#import "flodViewController.h"
#import "BlowViewController.h"
#import "CollectViewController.h"

#import <sys/utsname.h>


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *MainTableView;
@property (nonatomic,strong)NSMutableArray *MainArr;
@property (nonatomic,strong)NSMutableArray *VCArr;
@property (nonatomic,strong)MainViewController *ExtenVc;
@property (nonatomic,strong)FMDBViewController *FMdbVC;
@property (nonatomic,strong)MainBlockViewController *BlockVC;
@property (nonatomic,strong)AnimationViewController *AnimationVC;
@property (nonatomic,strong)JSOCViewController *OCandJSview;
@property (nonatomic,strong)KeyWordViewController *keyVC;
@property (nonatomic,strong)NotifitionViewController *NoVC;
@property (nonatomic,strong)ScrViewController *scrVC;
@property (nonatomic,strong)AFNViewController *afnVC;
@property (nonatomic,strong)netStateView *netVc;
@property (nonatomic,strong)flodViewController *flodVc;
@property (nonatomic,strong)SwiftViewController *swiftVc;
@property (nonatomic,strong)BlowViewController *BlowPicVC;
@property (nonatomic,strong)CollectViewController *collectVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.VCArr = [NSMutableArray array];
    self.MainArr = [NSMutableArray arrayWithObjects:@"FMDB使用",@"类别/类目/分类  延展",@"Block使用",@"弹窗", @"OC与IOS交互",@"ios关键字",@"通知",@"轮播图",@"AFN",@"cell折叠",@"Swift",@"下拉图片放大",@"SDWebimage使用",nil];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"这是一个主界面";
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"iphone6s",@"name",@"ios 11.0",@"system", nil];
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:@"iphoneInfo"];
    
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(click:)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeNetState:) name:@"changeNetState" object:nil];
   
    //plain是分区头会固定在屏幕顶部 Group是分区头随着滑出屏幕，这样分区与分区之间会有间隔，把分区脚高度设置为0就没有间隔了
    self.MainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCRWidth, SCRHeight) style:UITableViewStyleGrouped];
    self.MainTableView.delegate = self;
    self.MainTableView.dataSource = self;
    [self.MainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MainCell"];
    [self.view addSubview:_MainTableView];
    
    self.FMdbVC = [[FMDBViewController alloc]init];
    self.ExtenVc = [[MainViewController alloc]init];
    self.BlockVC = [[MainBlockViewController alloc]init];
    self.AnimationVC = [[AnimationViewController alloc]initWithNibName:@"AnimationViewController" bundle:nil];
    self.OCandJSview = [[JSOCViewController alloc]init];
    self.keyVC = [[KeyWordViewController alloc]init];
    self.NoVC = [[NotifitionViewController alloc]init];
    self.scrVC = [[ScrViewController alloc]init];
    self.afnVC = [[AFNViewController alloc]init];
    self.flodVc = [[flodViewController alloc]init];
    self.swiftVc = [[SwiftViewController alloc]init];
    self.BlowPicVC = [[BlowViewController alloc]init];
    self.collectVC = [[CollectViewController alloc]init];
    
    [self.VCArr addObjectsFromArray:@[_FMdbVC,_ExtenVc,_BlockVC,_AnimationVC,_OCandJSview,_keyVC,_NoVC,_scrVC,_afnVC,_flodVc,_swiftVc,_BlowPicVC,_collectVC]];

}

-(void)click:(UIBarButtonItem *)sender{
//    NSLog(@"点击了按钮获取手机型号");
//    
//    NSString *deceiveName = [[UIDevice currentDevice] name];
//    NSLog(@"设备名称：%@",deceiveName);
//    
//    NSString *systemName = [[UIDevice currentDevice]systemName];
//    NSLog(@"系统名称：%@",systemName);
//    
//    NSString *systemVersion = [[UIDevice currentDevice]systemVersion];
//    NSLog(@"系统版本：%@",systemVersion);
//    
//    //获取具体的iOS设备型号
//    struct utsname systemInfo;
//    uname(&systemInfo);
//    NSString *deceiveModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
//    if ([deceiveModel isEqualToString:@"iPhone8,1"]) {
//        NSLog(@"这是一台6S");
//    }
    
   NSDictionary *dic = (NSDictionary *)[[NSUserDefaults standardUserDefaults] objectForKey:@"iphoneInfo"];
    NSLog(@"%@ %@",[dic valueForKey:@"name"],[dic valueForKey:@"system"]);
    
    
    
}

-(void)changeNetState:(NSNotification *)nof{
    if ([nof.object isEqualToString:@"1"] || [nof.object isEqualToString:@"3"]) {
        NSLog(@"执行了通知");
        self.netVc = [netStateView shareStateView];
        
        self.netVc.frame = CGRectMake(0, 64, SCRWidth, 50);
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.view addSubview:_netVc];
            self.MainTableView.frame = CGRectMake(0, 114, SCRWidth, SCRHeight - 114);
        }];
    }else{
        if (self.netVc) {
            [UIView animateWithDuration:0.3 animations:^{
                [self.netVc removeFromSuperview];
                self.MainTableView.frame = CGRectMake(0, 64, SCRWidth, SCRHeight - 64);
            }];
        }
        
    }
    
   
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *headLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCRWidth, 60)];
    headLabel.text = @"iOS";
    headLabel.backgroundColor = [UIColor brownColor];
    return headLabel;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.MainArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    cell.textLabel.text = self.MainArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:self.VCArr[indexPath.row] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
