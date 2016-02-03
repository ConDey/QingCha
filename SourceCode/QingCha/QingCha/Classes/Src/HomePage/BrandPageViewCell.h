//
//  BrandPageViewCell.h
//  QingCha
//
//  Created by eazytec on 16/1/26.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandPageViewCell : UIView

@property (nonatomic,retain) UIImageView *bgimageview; // 背景图片,固定值

@property (nonatomic,retain) UILabel *titlelabel;
@property (nonatomic,retain) UIImageView *imageview;
@property (nonatomic,retain) UILabel *introductionlabel;

@property (nonatomic,retain) UIView  *transverse; // 一条分割线

@end
