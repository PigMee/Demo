//
//  netStateView.m
//  各种各样
//
//  Created by 董磊 on 2017/12/6.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "netStateView.h"

@implementation netStateView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatUi];
    }
    return self;
}

+(instancetype)shareStateView{
   static netStateView *view = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        view = [[netStateView alloc]init];
    });
    return view;
}

-(void)creatUi{
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 3;
    
    self.NetLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCRWidth, 50)];
    _NetLabel.text = @"请检查网络是否连接";
    _NetLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_NetLabel];

}

-(void)show{
    
}

-(void)disMiss{
    
}
@end
