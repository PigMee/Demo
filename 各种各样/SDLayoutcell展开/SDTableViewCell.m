//
//  SDTableViewCell.m
//  各种各样
//
//  Created by 董磊 on 2017/12/26.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "SDTableViewCell.h"

CGFloat maxContentLabelHeight = 0; // 根据具体font而定

@implementation SDTableViewCell
{
    UILabel *_ContentLabel;
    UILabel *_TimeLabel;
    UIButton *_ShowMoreBtn;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setup];
        
        self.contentView.backgroundColor = [UIColor cyanColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)setup{
    _ContentLabel = [UILabel new];
    _ShowMoreBtn = [UIButton new];
    _TimeLabel = [UILabel new];
    
    _ContentLabel.font = [UIFont systemFontOfSize:15];
    _ContentLabel.numberOfLines = 0;
    maxContentLabelHeight = _ContentLabel.font.lineHeight * 3;
    _ContentLabel.backgroundColor = [UIColor purpleColor];
    
    [_ShowMoreBtn setTitle:@"全文" forState:UIControlStateNormal];
    _ShowMoreBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    _ShowMoreBtn.backgroundColor = [UIColor whiteColor];
    [_ShowMoreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_ShowMoreBtn addTarget:self action:@selector(moreButton) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *Views = @[_ContentLabel,_TimeLabel,_ShowMoreBtn];
        
    [self.contentView sd_addSubviews:Views];
    
    _ContentLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView, 20)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    
    
    //按钮的高度在setmodel中给
    _ShowMoreBtn.sd_layout
    .leftEqualToView(_ContentLabel)
    .topSpaceToView(_ContentLabel, 5)
    .widthIs(30);
    
}


-(void)setModel:(SDmodel *)model{
    _model = model;
    
    _ContentLabel.text = model.Message;
    
    //如果文字高度超过3行
    if (model.shouldShowMoreButton) {
        _ShowMoreBtn.sd_layout.heightIs(20);
        _ShowMoreBtn.hidden = NO;
        if (model.isOpening) {//如果需要打开
            _ContentLabel.sd_layout.maxHeightIs(MAXFLOAT);
            [_ShowMoreBtn setTitle:@"收起" forState:UIControlStateNormal];
        }else{
            _ContentLabel.sd_layout.maxHeightIs(maxContentLabelHeight);
            [_ShowMoreBtn setTitle:@"全文" forState:UIControlStateNormal];
        }
        
    }else{
        _ShowMoreBtn.sd_layout.heightIs(0);
        _ShowMoreBtn.hidden = YES;
    }
    
    
}

-(void)moreButton{
    if (self.moreButtonClickedBlock) {
        self.moreButtonClickedBlock(self.indexPath);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
