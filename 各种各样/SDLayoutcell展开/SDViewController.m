//
//  SDViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/12/25.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "SDViewController.h"
#import "SDTableViewCell.h"
#import "SDmodel.h"

@interface SDViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *sd_tableVC;
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSMutableArray *modelArr;

@end

@implementation SDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.modelArr = [NSMutableArray array];
    
    self.dataArr = [NSMutableArray arrayWithObjects:
                    @"天璇圣地进攻荒古禁地唯一的幸存者，绝技为六道轮回拳、天璇步法（脱胎于“行”字秘，在老疯子得到完整行字秘后舍而不用）等。在当年便名震天下，如今却变得疯疯癫癫。曾在荒古禁地中将叶凡带出，又出现在魏国太玄派，因横渡虚空失败而昏迷，蜕变后离去，化为年青模样与叶凡等相见于天璇遗址中，在叶凡告知其“行”字秘消息后与他们一同前往圣崖，取得秘法。后来到紫微星域得到太阴古皇传承，再次蜕变，大战来犯的太古生物并大难不死，在人族古路参与乱战。叶凡重立天庭后成为天庭柱石，叶凡两千九百余岁时坐化于上苍古洞中。",
                    @"无良胖道士，第一世为渡劫天尊曹雨生，九大天尊之一。创出渡劫天功、渡劫纹。第二世系冥皇，即冥尊、亦即源帝，地府开创者，试图再造轮回；与帝尊关系亦师亦友。第五世即今世，通过不断地破而后立、立而后破修炼；精通风水墓葬学，修成阴阳天眼；法宝为一个破碗，内有宝物无数；喜欢挖墓，臭名昭彰；和叶凡相互算计，但更多时候是战友关系。终战时已真正觉醒，与叶凡一同破灭帝尊阴谋。",
                    @"初次出场于乱云州山岩城的神秘少女，冷漠自负，师承盖九幽，得到盖九幽传承，和其有相同体质。",
                    @"姜家的一名东荒神王，叶凡的恩人和半师，名震天下却一生凄凉，最终为平定史上最大暗黑动乱而死，后被叶凡复活。",
                    @"主角红颜，妖族女子，颜如玉部属，外表美丽惑人。多次挑逗叶凡，在一次宴会后与叶凡酒后乱性。爱上叶凡，在其自紫微回归后拼命修炼，不幸入岔而死。",
                    @"天璇圣地进攻荒古禁地唯一的幸存者，绝技为六道轮回拳、天璇步法（脱胎于“行”字秘，在老疯子得到完整行字秘后舍而不用）等。在当年便名震天下，如今却变得疯疯癫癫。曾在荒古禁地中将叶凡带出，又出现在魏国太玄派，因横渡虚空失败而昏迷，蜕变后离去，化为年青模样与叶凡等相见于天璇遗址中，在叶凡告知其“行”字秘消息后与他们一同前往圣崖，取得秘法。后来到紫微星域得到太阴古皇传承，再次蜕变，大战来犯的太古生物并大难不死，在人族古路参与乱战。叶凡重立天庭后成为天庭柱石，叶凡两千九百余岁时坐化于上苍古洞中。",
                    nil];
    
    [self creatModel];
    
    self.sd_tableVC = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCRWidth, SCRHeight - 64) style:UITableViewStyleGrouped];
    
    self.sd_tableVC.delegate = self;
    self.sd_tableVC.dataSource = self;
    
    [self.sd_tableVC registerClass:[SDTableViewCell class] forCellReuseIdentifier:@"sd_cell"];
    
    [self.view addSubview:self.sd_tableVC];
}

-(void)creatModel{
    for (int i = 0; i < _dataArr.count; i ++) {
        SDmodel *model = [[SDmodel alloc]init];
        model.Message = _dataArr[i];
        [_modelArr addObject:model];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _modelArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SDTableViewCell *cell = [_sd_tableVC dequeueReusableCellWithIdentifier:@"sd_cell"];
    
    cell.indexPath = indexPath;
    __weak typeof(self) weakSelf = self;
    if (!cell.moreButtonClickedBlock) {
        [cell setMoreButtonClickedBlock:^(NSIndexPath *indexPath) {
            SDmodel *model = weakSelf.modelArr[indexPath.row];
            model.isOpening = !model.isOpening;
            [weakSelf.sd_tableVC reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
    
    cell.model = self.modelArr[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id model = self.modelArr[indexPath.row];
    
    return [self.sd_tableVC cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[SDTableViewCell class] contentViewWidth:[self cellContentViewWith]];
}


- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
