//
//  NSString+CategoryName.m
//  各种各样
//
//  Created by 董磊 on 2017/11/20.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "NSString+CategoryName.h"
#import <objc/runtime.h>

static char strKey;
@implementation NSString (CategoryName)

-(void)pushName:(NSString *)name{
    //对name进行操作
    NSLog(@"%@",name);
}


//通过运行时给类目添加属性
//使用Runtime给类目添加属性
-(void)setNameStr:(NSString *)NameStr{
    objc_setAssociatedObject(self, &strKey, NameStr, OBJC_ASSOCIATION_COPY);
}


-(NSString *)NameStr{
    return objc_getAssociatedObject(self, &strKey);
}

@end
