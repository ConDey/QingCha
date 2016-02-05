//
//  ArtifactHeadViewCell.h
//  QingCha
//
//  Created by eazytec on 16/2/3.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <PSCollectionView/PSCollectionView.h>

// 品牌列表标题cell

@interface ArtifactListHeadViewCell : PSCollectionViewCell

@property (nonatomic,retain) UIImageView *imageView;

+ (CGFloat)width;  //宽度, 默认是两列,宽度是根据SCREEN_WIDTH来计算的
+ (CGFloat)height; //高度, 是根据宽度来计算的,也是固定值

@end
