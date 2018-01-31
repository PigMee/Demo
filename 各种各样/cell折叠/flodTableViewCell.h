//
//  flodTableViewCell.h
//  各种各样
//
//  Created by 董磊 on 2017/12/14.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "flodModel.h"

typedef void(^MessageMoreClick)(NSIndexPath *IndexPath);

@interface flodTableViewCell : UITableViewCell
@property (nonatomic,strong)UIView *GroundView;

@property (nonatomic,strong)UILabel *MessageLabel;

@property (nonatomic,strong)YYLabel *NameLabel;

@property (nonatomic,strong)UIButton *FlodMessageBtn;

@property (nonatomic,strong)UIButton *FlodNameBtn;

@property (nonatomic,strong)flodModel *Model;

@property (nonatomic,strong)NSIndexPath *IndexPath;

@property (nonatomic,copy)void(^ClickMoreMessageBlock)(NSIndexPath *indexpth);

@property (nonatomic,copy)MessageMoreClick MessageClickBlock;



@end
