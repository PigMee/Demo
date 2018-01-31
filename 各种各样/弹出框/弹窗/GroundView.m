//
//  GroundView.m
//  各种各样
//
//  Created by 董磊 on 2017/11/22.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "GroundView.h"

@implementation GroundView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor brownColor];
        self.userInteractionEnabled = YES;
        
        self.showBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 80, SCRWidth - 40,  50)];
        [_showBtn setTitle:@"弹出底部视图" forState:UIControlStateNormal];
        _showBtn.backgroundColor = [UIColor redColor];
        [self addSubview:_showBtn];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dis)];
        self.alpahView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCRWidth,  SCRHeight)];
        self.alpahView.backgroundColor = [UIColor blackColor];
        self.alpahView.alpha = 0.2;
        self.alpahView.userInteractionEnabled = YES;
        [self.alpahView addGestureRecognizer:tap];
        [self addSubview:_alpahView];
    }
    return self;
}

-(void)dis{
    if (self.delegate && [self.delegate respondsToSelector:@selector(disMiss)]) {
        [self.delegate disMiss];
    }
}


@end
