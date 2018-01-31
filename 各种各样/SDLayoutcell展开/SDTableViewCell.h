//
//  SDTableViewCell.h
//  各种各样
//
//  Created by 董磊 on 2017/12/26.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDmodel.h"

@interface SDTableViewCell : UITableViewCell
@property (nonatomic,strong)SDmodel *model;

@property (nonatomic,strong)UIView *GroundView;

@property (nonatomic,strong)UILabel *TextLabel;

@property (nonatomic,strong)UIButton *ShowMoreBtn;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, copy) void (^moreButtonClickedBlock)(NSIndexPath *indexPath);

@end
