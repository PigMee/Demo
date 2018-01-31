//
//  FMDBViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/13.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "FMDBViewController.h"
#import "AddModelViewController.h"


@interface FMDBViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *DataArr;
    NSMutableArray *ModelArr;
    DBManger *db_manger;
}
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation FMDBViewController

-(void)viewWillAppear:(BOOL)animated{
    [self DataManger];
    if (self.tableView) {
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataArr = [NSMutableArray array];
    ModelArr = [NSMutableArray array];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addModel:)];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCRWidth, SCRHeight - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //创建数据库表 当创建过此表再次走这句就不会在进行创建
    db_manger = [DBManger ShareDBManger];
    [db_manger creatTableBase];
    
    //查询数据库 为数据源数组赋值
    [self DataManger];
    
    [self.view addSubview:self.tableView];
   
}

-(void)DataManger{
    ModelArr = (NSMutableArray *)[[DBManger ShareDBManger] sectleteAllUer];
    NSLog(@"%ld",ModelArr.count);
}


-(void)addModel:(UIBarButtonItem *)sender{
    AddModelViewController *AddVc = [[AddModelViewController alloc]initWithNibName:@"AddModelViewController" bundle:nil];
    [self.navigationController pushViewController:AddVc animated:YES];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ModelArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserModel *model = ModelArr[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = model.name;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
