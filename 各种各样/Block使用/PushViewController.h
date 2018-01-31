//
//  PushViewController.h
//  各种各样
//
//  Created by 董磊 on 2017/11/20.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^aBlock)(int);

@interface PushViewController : UIViewController
@property (nonatomic,copy)void (^SendBlock)(NSString * , NSString *);
@property (nonatomic,copy)aBlock bBlock;


-(void)countBigNumberOne:(int)numberOne
               NumberTwo:(int)numberTwo
                  BigOne:(aBlock)bigOne;

@end
