//
//  JScallOCViewController.h
//  各种各样
//
//  Created by 董磊 on 2017/11/23.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JSdelegate <JSExport>

- (void)call;
- (void)getCall:(NSString *)callString;

@end

@interface JScallOCViewController : UIViewController

@end
