//
//  BottomView.m
//  各种各样
//
//  Created by 董磊 on 2017/11/22.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
    }
    return self;
}

@end
