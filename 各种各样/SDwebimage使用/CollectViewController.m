//
//  CollectViewController.m
//  各种各样
//
//  Created by 董磊 on 2018/1/3.
//  Copyright © 2018年 董磊. All rights reserved.
//

#import "CollectViewController.h"



@interface CollectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray *DataArr;

@property (nonatomic,strong)UICollectionView *ImageCollctionView;

@property (nonatomic,strong)UICollectionViewFlowLayout *layOut;

@end

@implementation ImageCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.cellImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self.contentView addSubview:_cellImage];
    }
    return self;
}

-(void)configWithDataArr:(UIImage *)Image{
    if (Image) {
        self.cellImage.image = Image;
    }
}

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.DataArr = [NSMutableArray array];
    
    for (int i = 0; i < 29; i ++ ) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"IMG_%d.JPG",i]];
        [self.DataArr addObject:image];
    }
    
    self.layOut = [[UICollectionViewFlowLayout alloc]init];
    self.layOut.itemSize = CGSizeMake((SCRWidth - 5) / 3, SCRWidth / 2);
    
    self.ImageCollctionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCRWidth, SCRHeight - 64) collectionViewLayout:_layOut];
    self.ImageCollctionView.backgroundColor = [UIColor whiteColor];
    
    [self.ImageCollctionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    self.ImageCollctionView.delegate = self;
    self.ImageCollctionView.dataSource = self;
    
    [self.view addSubview:self.ImageCollctionView];
    
    // Do any additional setup after loading the view.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _DataArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UIImage *image = _DataArr[indexPath.row];
    
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell configWithDataArr:image];
    
    return cell;
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 2, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
