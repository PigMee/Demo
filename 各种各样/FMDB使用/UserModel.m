//
//  UserModel.m
//  各种各样
//
//  Created by 董磊 on 2017/11/13.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+(instancetype)StudentWithName:(NSString *)name phonenumber:(NSString *)number{
    UserModel *model = [[UserModel alloc]init];
    model.name = name;
    model.phoneNumber = number;
    return model;
}

@end
