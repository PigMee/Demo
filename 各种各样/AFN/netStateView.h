//
//  netStateView.h
//  各种各样
//
//  Created by 董磊 on 2017/12/6.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface netStateView : UIView
@property (nonatomic,strong)UILabel *NetLabel;

+(instancetype)shareStateView;

-(void)show;

-(void)disMiss;

@end
