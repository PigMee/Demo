//
//  CollectViewController.h
//  各种各样
//
//  Created by 董磊 on 2018/1/3.
//  Copyright © 2018年 董磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectViewController : UIViewController

@end

@interface ImageCell : UICollectionViewCell

@property (nonatomic,strong)UIImageView *cellImage;

-(void)configWithDataArr:(UIImage *)Image;

@end
