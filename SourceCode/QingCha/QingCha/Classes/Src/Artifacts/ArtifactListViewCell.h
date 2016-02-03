//
//  ArtifactListViewCell.h
//  QingCha
//
//  Created by eazytec on 16/2/3.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <PSCollectionView/PSCollectionView.h>

// 品牌下作品列表cell

@interface ArtifactListViewCell : PSCollectionViewCell

@property (nonatomic,retain) UIImageView *imageView;

@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) UILabel *introductionLabel;


+ (CGFloat)width;  //宽度, 默认是两列,宽度是根据SCREEN_WIDTH来计算的
+ (CGFloat)height; //高度, 是根据宽度来计算的,也是固定值

@end
