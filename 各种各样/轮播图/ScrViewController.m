//
//  ScrViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/29.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "ScrViewController.h"

#define imageCount 10 //图片的张数

static NSInteger pageNumber = 0;//用于记录计时器计时循环

@interface ScrViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIPageControl *pageController;
@property (nonatomic,weak)NSTimer *timer;

@end

@implementation ScrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeaction) userInfo:nil repeats:YES];
    
    [self initView];
    
}

-(void)initView{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCRWidth, SCRHeight - 64)];
    self.scrollView.contentSize = CGSizeMake((imageCount + 2) * SCRWidth, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentOffset = CGPointMake(1*SCRWidth, 0);
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    //添加图片
    for (int i = 0; i < imageCount+2; i++) {
        if (i == 0) {
            UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCRWidth, 0, SCRWidth, SCRHeight)];
            [self.scrollView addSubview:imageV];
            imageV.image = [UIImage imageNamed:@"IMG_10.JPG"];
        } else if(i == imageCount + 1){
            UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCRWidth, 0, SCRWidth, SCRHeight)];
            [self.scrollView addSubview:imageV];
            imageV.image = [UIImage imageNamed:@"IMG_1.JPG"];
        }else{
            UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCRWidth, 0, SCRWidth, SCRHeight)];
            [self.scrollView addSubview:imageV];
            imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"IMG_%d.JPG",i]];
        }
    }
    
    //在scrollView上添加page
    self.pageController = [[UIPageControl alloc] init];
    [self.view addSubview:self.pageController];
    self.pageController.frame = CGRectMake(SCRWidth/2 - 50, SCRHeight-20, 100, 25);
    self.pageController.numberOfPages = imageCount;
    self.pageController.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageController.currentPageIndicatorTintColor = [UIColor cyanColor];
    self.pageController.currentPage = 0;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scr = scrollView.contentOffset.x / SCRWidth;
    NSInteger number = (NSInteger)scr;
//    NSLog(@"%f",scr - number);
    if (number == imageCount + 1 || (number == imageCount && scr - number > 0.5)) {
        self.pageController.currentPage = 0;
    }else if (number == 0 && (number == 0 && scr - number < 0.5)){
        self.pageController.currentPage = imageCount - 1;
    }else{
        if (scr - number > 0.5) {
            self.pageController.currentPage = number;
        }else{
            self.pageController.currentPage = number - 1;
        }
    }
}


//scrollView结束减速
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.scrollView.contentOffset.x == (imageCount + 1)*SCRWidth) {//手动滑到最后一张ImageView
        self.scrollView.contentOffset = CGPointMake(SCRWidth, 0);
    }else if (self.scrollView.contentOffset.x == 0*SCRWidth) {//手动滑到第一张ImageView
        self.scrollView.contentOffset = CGPointMake(imageCount*SCRWidth, 0);//跳到了倒数第二张ImageView(即最后一张图)
    }
    //启动定时器
    [self beginAction];
    //拖拽结束后给记录轮播到第几张的变量赋值
    NSInteger number = (NSInteger)self.scrollView.contentOffset.x/SCRWidth;
    if (number == imageCount+1){//在最后一张(向左才会到这里)
        pageNumber = 0;
    }else if(number == 0){//在scrollView的第一张(向右才会到这里)
        pageNumber = imageCount -1;
    }else{
        pageNumber = number - 1;
    }
}
//开始拖拽
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //结束计时
    [self stopAction];
}

#pragma mark -- 点击事件
-(void)timerAction{
    if(pageNumber == imageCount){//在第一张图（最后一张ImageView）
        pageNumber = 0;
        //跳到第一张图
        self.scrollView.contentOffset = CGPointMake(SCRWidth,0);
        //然后滑到视觉上第二张图片
        [UIView animateWithDuration:0.5 animations:^{
            self.scrollView.contentOffset = CGPointMake((pageNumber+2)*SCRWidth,0);
        }];
    }else if(pageNumber == 0){//在第一张图(第二张ImageView)
        //滑到视觉上第二张图
        [UIView animateWithDuration:0.5 animations:^{
            self.scrollView.contentOffset = CGPointMake((pageNumber+2)*SCRWidth,0);
        }];
    }else {
        [UIView animateWithDuration:0.5 animations:^{
            self.scrollView.contentOffset = CGPointMake((pageNumber+2)*SCRWidth,0);
        }];
    }
    pageNumber++;
}
#pragma mark -- 私有方法
-(void)beginAction{
    //如果计时器已开启  先停止
    if (self.timer) [self stopAction];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
-(void)stopAction{
    [self.timer invalidate];
    self.timer = nil;
}


-(void)timeaction{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
