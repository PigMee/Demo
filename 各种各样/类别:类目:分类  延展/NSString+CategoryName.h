//
//  NSString+CategoryName.h
//  各种各样
//
//  Created by 董磊 on 2017/11/20.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CategoryName)
@property(nonatomic,copy)NSString *NameStr;

-(void)pushName:(NSString *)name;

@end
