//
//  SDmodel.h
//  各种各样
//
//  Created by 董磊 on 2017/12/26.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDmodel : NSObject

@property (nonatomic,copy)NSString *Message;

@property (nonatomic, assign) BOOL isOpening;

@property (nonatomic, assign, readonly) BOOL shouldShowMoreButton;

@end
