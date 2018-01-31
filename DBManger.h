//
//  DBManger.h
//  各种各样
//
//  Created by 董磊 on 2017/11/17.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "UserModel.h"

@interface DBManger : NSObject

//管理类单例
+(DBManger *)ShareDBManger;


//创建数据库
-(BOOL)creatTableBase;


//插入数据
-(BOOL)insertUser:(UserModel *)model;


//查询所有数据
-(NSMutableArray *)sectleteAllUer;
@end
