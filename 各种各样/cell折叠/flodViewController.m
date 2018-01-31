//
//  flodViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/12/14.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "flodViewController.h"
#import "flodTableViewCell.h"
#import "flodModel.h"


@interface flodViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *flodTableVC;
@property (nonatomic,strong)NSMutableArray *DataSourceArr;
@property (nonatomic,strong)NSMutableArray *ModelArr;


@end

@implementation flodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.ModelArr = [[NSMutableArray alloc]init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化model
    [self initModel];
    
    [self setTableView];
    
    
    
    
    
}

-(void)initModel{
    for (NSDictionary *dic in self.DataSourceArr) {
        flodModel *model = [[flodModel alloc]initWithDic:dic];
        [self.ModelArr addObject:model];
    }
}

-(void)setTableView{
    self.flodTableVC = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCRWidth, SCRHeight - 64) style:UITableViewStylePlain];
    [self.flodTableVC registerClass:[flodTableViewCell class] forCellReuseIdentifier:@"FlodCell"];
    self.flodTableVC.delegate = self;
    self.flodTableVC.dataSource = self;
    [self.view addSubview:_flodTableVC];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    flodModel *model = self.ModelArr[indexPath.row];
    return model.CellHeight;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.ModelArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    flodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FlodCell" forIndexPath:indexPath];
    
    __weak typeof(self) weakSelf = self;
    
    flodModel *model = self.ModelArr[indexPath.row];
    
    cell.IndexPath = indexPath;
    
    if (!cell.ClickMoreMessageBlock) {
        [cell setClickMoreMessageBlock:^(NSIndexPath *Indexpath){
            if (!model.isOpening) {
                if (model.isShowMessageBtn) {
                    model.CellHeight = model.MessageHeight + 55;
                }
                
            }else{
                if (model.isShowMessageBtn) {
                    model.CellHeight = ThreeLineHeight + 55;
                }
            }
            model.isOpening = !model.isOpening;
            [weakSelf.flodTableVC beginUpdates];
            [weakSelf.flodTableVC reloadRowsAtIndexPaths:@[Indexpath] withRowAnimation:UITableViewRowAnimationNone];
            [weakSelf.flodTableVC endUpdates];
        }];
    }
    
    cell.Model = model;
    
    return cell;
}

-(NSMutableArray *)DataSourceArr{
    if (!_DataSourceArr) {
        self.DataSourceArr = [NSMutableArray arrayWithObjects:
                    @{@"message":@"房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了；思考哈根达斯；凤凰快递费哈萨克地方哈卡萨丁鸿口",
                      @"names":@"0"},
                    @{@"message":@"房后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了娄山关路看电视疯狂过后沙鲁克汗了房公开了公开了价格间",
                      @"names":@"1"},
//                    @{@"message":@"房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省快递费哈萨克地方哈卡萨丁鸿福口",@"names":@"2"},
//                    @{@"message":@"房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省快递费哈萨克地方哈卡萨丁鸿福口",@"names":@"3"},
                    @{@"message":@"房间卡收到的撒娇和反馈哈手机客户可话费卡刷卡乐山大房间卡收到的撒娇和反馈哈手机客户可话费卡刷卡乐山大佛快佛快捷回复水的1回复可见安徽省快递费哈萨克地方哈卡萨丁鸿福口",@"names":@"4"},
                    @{@"message":@"房间卡收到看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了卡收到束带结发开始劳动纪律看似简单分类世纪东方回复可见安徽省快递费哈萨克地方哈卡萨丁鸿福口看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了卡收到束带结发开始劳动纪律看似简单分类世纪东方回复可见安徽省快递费哈萨克地方哈卡萨丁鸿福口看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了卡收到束带结发开始劳动纪律看似简单分类世纪东方回复可见安徽省快递费哈萨克地方哈卡萨丁鸿福口回复可见安徽省快递费哈萨克地方哈卡萨丁鸿福口",@"names":@"5"},
//                    @{@"message":@"房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收适得府君书离开的房价合理规划上了到回复可见安徽省快递费哈萨克地方哈卡萨丁鸿福口",@"names":@"6"},
//                    @{@"message":@"房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯狂过后沙鲁克汗了房间卡收到回复可见安徽省快递费哈萨克地方哈卡萨丁鸿福口",@"names":@"7"},
                    @{@"message":@"房间房间卡收到回复可见安徽省上的尽快发货刚开始的房间号刚开始的积分换个惹你娄山关路看电视疯z",@"names":@"8"}, nil];
    }
    return _DataSourceArr;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
