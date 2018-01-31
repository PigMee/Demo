//
//  flodTableViewCell.m
//  各种各样
//
//  Created by 董磊 on 2017/12/14.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "flodTableViewCell.h"
#define padding 5


@implementation flodTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //初始化cell界面
        [self setUiOfCell];
    }
    return self;
}

-(void)setUiOfCell{
    //添加cell的背景view
    [self.contentView addSubview:self.GroundView];
    [self.GroundView addSubview:self.MessageLabel];
    [self.GroundView addSubview:self.FlodMessageBtn];
    [self.GroundView addSubview:self.NameLabel];
    [self.GroundView addSubview:self.FlodNameBtn];
    
    
    
    [self.GroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(padding, padding, padding, padding));
    }];
    
    [self.MessageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.GroundView).offset(padding);
        make.right.equalTo(self.GroundView).offset(-padding);
        make.top.equalTo(self.GroundView).offset(padding);
        make.height.equalTo(@10);
    }];
    
    [self.FlodMessageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@70);
        make.height.equalTo(@30);
        make.top.mas_equalTo(self.MessageLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(self.GroundView).offset(-padding);
    }];
}

-(void)setModel:(flodModel *)Model{
    _Model = Model;
    if (Model) {
        self.MessageLabel.text = Model.Message;
        NSNumber *MessageHeight = [NSNumber numberWithFloat:Model.MessageHeight + 0.5];
        if (Model.MessageHeight <= ThreeLineHeight) {
            [self.MessageLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(MessageHeight);
            }];
            [self.FlodMessageBtn setHidden:YES];
        }else{
            if (!Model.isOpening) {
                [self.MessageLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(@52);
                    }];
            }else{
                [self.MessageLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(MessageHeight);
                }];
            }
            
            
        }
    }
    
}

//按钮的点击事件
-(void)UnflodMessageAction:(UIButton *)sender{
    
    if (self.ClickMoreMessageBlock) {
        self.ClickMoreMessageBlock(self.IndexPath);
    }
    
}

//控件懒加载
-(UIView *)GroundView{
    if (!_GroundView) {
        self.GroundView = [[UIView alloc]init];
        _GroundView.backgroundColor = COLOR(255, 250, 205, 1.0);
        _GroundView.layer.cornerRadius = 15;
        _GroundView.layer.masksToBounds = YES;
    }
    return _GroundView;
}

-(UILabel *)MessageLabel{
    if (!_MessageLabel) {
        self.MessageLabel = [[UILabel alloc]init];
        _MessageLabel.backgroundColor = COLOR(141, 238, 238, 1.0);
        _MessageLabel.numberOfLines = 0;
        _MessageLabel.font = [UIFont systemFontOfSize:14];
    }
    return _MessageLabel;
}

-(YYLabel *)NameLabel{
    if (!_NameLabel) {
        self.NameLabel = [[YYLabel alloc]init];
        _NameLabel.backgroundColor = COLOR(187, 255, 255, 1.0);
    }
    return _NameLabel;
}

-(UIButton *)FlodMessageBtn{
    if (!_FlodMessageBtn) {
        self.FlodMessageBtn = [[UIButton alloc]init];
        [_FlodMessageBtn setTitle:@"展开" forState:UIControlStateNormal];
        _FlodMessageBtn.layer.cornerRadius = 8;
        _FlodMessageBtn.layer.masksToBounds = YES;
        _FlodMessageBtn.backgroundColor = COLOR(255, 106, 106, 1.0);
        [_FlodMessageBtn addTarget:self action:@selector(UnflodMessageAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _FlodMessageBtn;
}

-(UIButton *)FlodNameBtn{
    if (!_FlodNameBtn) {
        self.FlodNameBtn = [[UIButton alloc]init];
    }
    return _FlodNameBtn;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
