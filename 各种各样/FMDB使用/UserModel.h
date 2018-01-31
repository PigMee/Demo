//
//  UserModel.h
//  各种各样
//
//  Created by 董磊 on 2017/11/13.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *phoneNumber;

+(instancetype)StudentWithName:(NSString *)name phonenumber:(NSString *)number;


@end
