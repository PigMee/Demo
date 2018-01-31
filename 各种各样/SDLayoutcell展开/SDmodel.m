//
//  SDmodel.m
//  各种各样
//
//  Created by 董磊 on 2017/12/26.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "SDmodel.h"

extern CGFloat maxContentLabelHeight;


@implementation SDmodel
{
    CGFloat _lastContentWidth;
}


-(NSString *)Message{
    CGFloat realWidth = SCRWidth - 30;
    if (realWidth != _lastContentWidth) {
        _lastContentWidth = realWidth;
        CGSize textSize = [_Message boundingRectWithSize:CGSizeMake(realWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
        
        if (textSize.height > maxContentLabelHeight) {
            _shouldShowMoreButton = YES;
        }else{
            _shouldShowMoreButton = NO;
        }
    }
    return _Message;
}

- (void)setIsOpening:(BOOL)isOpening
{
    if (!_shouldShowMoreButton) {
        _isOpening = NO;
    } else {
        _isOpening = isOpening;
    }
}


@end
