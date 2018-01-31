//
//  flodModel.m
//  各种各样
//
//  Created by 董磊 on 2017/12/14.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "flodModel.h"

extern  CGFloat MaxThreeLineHeight;
extern const CGFloat SizeOfText;

@implementation flodModel

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.Names = [dic valueForKey:@"names"];
        self.Message = [dic valueForKey:@"message"];
        
        //计算消息高度
        self.MessageHeight = [self calculateStringHeight:self.Message];
        
        self.isOpening = NO;
        
        if (self.MessageHeight <= ThreeLineHeight ) {
            self.CellHeight = _MessageHeight + 20;
        }else if (self.MessageHeight > ThreeLineHeight){
            self.CellHeight = ThreeLineHeight + 20 + 35;
        }
        
    }
    return self;
}

-(CGFloat)calculateStringHeight:(NSString *)string{
    CGSize textSize2 = [string boundingRectWithSize:CGSizeMake(SCRWidth - 20, CGFLOAT_MAX)
                                                  options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                                  context:nil].size;
    if (textSize2.height > ThreeLineHeight) {
        _isShowMessageBtn = YES;
    }else{
        _isShowMessageBtn = NO;
    }
    
    return textSize2.height;
}

@end
