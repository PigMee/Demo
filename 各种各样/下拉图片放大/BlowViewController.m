//
//  BlowViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/12/28.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "BlowViewController.h"

@interface BlowViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *Bow_tableView;

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIColor *backColor;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, strong) UIImage *ColorImage;

@property (nonatomic, strong) UIView *headerContentView;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, assign) CGFloat alpha;

@property (nonatomic, assign) CGFloat recoder_offSet_y;

@end

@implementation BlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor grayColor];
    self.headerHeight = 260;
    [self.view addSubview:self.Bow_tableView];
    
    self.alpha = 0;

    self.ColorImage = [UIImage imageWithRed:0 Green:0 Blue:0 Alpha:_alpha];
    
    //去掉背景图片
    [self.navigationController.navigationBar setBackgroundImage:_ColorImage forBarMetrics:UIBarMetricsDefault];
    
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    //标题
    self.navigationItem.title = @"个人信息";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    //header
    CGRect bounds = CGRectMake(0, 0, SCRWidth, 260);
    UIView *contentView = [[UIView alloc] initWithFrame:bounds];
    contentView.backgroundColor = [UIColor blackColor];
    //背景
    UIImageView *headerImageView = [[UIImageView alloc] init];
    headerImageView.bounds = bounds;
    headerImageView.center = contentView.center;
    headerImageView.image = [UIImage imageNamed:@"ddl.jpg"];
    contentView.layer.masksToBounds = YES;
    
    self.headerImageView = headerImageView;
    self.headerContentView = contentView;
    [self.headerContentView addSubview:self.headerImageView];
    self.headerContentView.layer.masksToBounds = YES;

    
    UIView *headerView = [[UIView alloc] initWithFrame:bounds];
    [headerView addSubview:self.headerContentView];
    self.Bow_tableView.tableHeaderView = headerView;
    
    
    //自定义导航条控件
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
}

-(void)backAction{
    NSLog(@"点击了按钮");
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.recoder_offSet_y = scrollView.contentOffset.y;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset_Y = scrollView.contentOffset.y;
    
    NSLog(@"%f",offset_Y);
    
    _alpha = offset_Y/260.0f;
    
    self.ColorImage = [UIImage imageWithRed:0 Green:0 Blue:0 Alpha:_alpha];
    
    [self.navigationController.navigationBar setBackgroundImage:_ColorImage forBarMetrics:UIBarMetricsDefault];
    
    //图片缩放
    if (offset_Y < 0) {
        //图片的高度
        CGFloat add_height = -offset_Y;
        //缩放比例
        self.scale = (add_height + 260) / 260;
        //改变图片的frame
        CGRect contentView_frame = CGRectMake(0, offset_Y, SCRWidth, 260 + add_height);
        self.headerContentView.frame = contentView_frame;

        
        CGRect change_imageFrame = CGRectMake(-(SCRWidth * self.scale - SCRWidth)/2.0f,0,SCRWidth * self.scale,260+add_height);
        self.headerImageView.frame = change_imageFrame;
    }
    
    //判断向上滑 还是向下滑
    if (offset_Y > self.recoder_offSet_y) {
        NSLog(@"向上滑");
        if (offset_Y == 64) {
            self.headerImageView.image = [UIImage imageNamed:@"timg.jpeg"];
            
        }
    }else{
        NSLog(@"向下滑");
        if (offset_Y == 64) {
            self.headerImageView.image = [UIImage imageNamed:@"ddl.jpg"];
        }
    }
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell--%ld",indexPath.row];
    
    return cell;
}

-(UITableView *)Bow_tableView{
    if (!_Bow_tableView) {
        self.Bow_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCRWidth, SCRHeight) style:UITableViewStylePlain];
        
        _Bow_tableView.delegate = self;
        _Bow_tableView.dataSource = self;
        
        [_Bow_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _Bow_tableView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
