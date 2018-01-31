//
//  flodModel.h
//  各种各样
//
//  Created by 董磊 on 2017/12/14.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface flodModel : NSObject

@property (nonatomic,copy)NSString *Message;

@property (nonatomic,copy)NSString *Names;

@property (nonatomic,assign)float MessageHeight;

@property (nonatomic,assign)float NamesHeight;

@property (atomic,assign)float CellHeight;

@property (nonatomic,assign,readonly)BOOL isShowMessageBtn;

@property (nonatomic,assign)BOOL isOpening;

-(instancetype)initWithDic:(NSDictionary *)dic;

@end
