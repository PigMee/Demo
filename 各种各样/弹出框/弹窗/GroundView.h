//
//  GroundView.h
//  各种各样
//
//  Created by 董磊 on 2017/11/22.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DismissDelegete <NSObject>

-(void)disMiss;

@end

@interface GroundView : UIView
@property (nonatomic,strong)UIButton *showBtn;
@property (nonatomic,strong)UIView *alpahView;
@property (nonatomic,weak)id <DismissDelegete>delegate;

@end
