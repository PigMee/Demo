//
//  DBManger.m
//  各种各样
//
//  Created by 董磊 on 2017/11/17.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "DBManger.h"

static FMDatabase *_fmdb;

@implementation DBManger

+(DBManger *)ShareDBManger{
    static DBManger *manger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [[DBManger alloc]init];
    });
    return manger;;
}


//创建数据库
-(BOOL)creatTableBase{
    //拼接路径
   NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"USER.sqlite"];
    
    _fmdb = [FMDatabase databaseWithPath:filePath];
    
    //打开数据库 如果不存在创建并打开
    BOOL open = [_fmdb open];
    
    if (open) {
        NSLog(@"打开数据库成功");
    }
    
    //创建表
    BOOL isSucc = [_fmdb executeUpdate:@"create table if not exists A_User(id integer primary key, name text, phonenumber text);"];
    
    NSLog(@"创建表成功");
    
//    [_fmdb close];
    return isSucc;
}


//插入数据
-(BOOL)insertUser:(UserModel *)model{
//    [_fmdb open];
    NSString *insertSql = @" INSERT INTO A_User(name, phonenumber)VALUES(?,?)";
    
    BOOL isInsert = [_fmdb executeUpdate:insertSql,model.name,model.phoneNumber];
    
    if (isInsert) {
        NSLog(@"插入数据成功");
    }
//    [_fmdb close];
    return isInsert;
}


//查询所有数据
-(NSMutableArray *)sectleteAllUer{
//    [_fmdb open];
    NSMutableArray *resultArr = [NSMutableArray array];
    NSString *selectSql = @"select * from A_User";
    
    FMResultSet *resultSet = [_fmdb executeQuery:selectSql];
    
    while (resultSet.next) {
        UserModel *model = [[UserModel alloc]init];
        model.name = [resultSet stringForColumn:@"name"];
        model.phoneNumber = [resultSet stringForColumn:@"phonenumber"]; 
        [resultArr addObject:model];
    }
//    [_fmdb close];
    return resultArr;
    
}




@end
