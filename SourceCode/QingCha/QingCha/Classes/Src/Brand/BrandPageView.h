//
//  BrandPageView.h
//  QingCha
//
//  Created by eazytec on 16/1/25.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BrandPageViewCell.h"

#define RIGHT_VIEW_CELL_RATIO 9.5  //rightViewCell系数

// 品牌PageView包装类,不能直接被使用!

@class BrandPageView;
@protocol BrandPageViewDelegate <UIScrollViewDelegate>

@required
- (NSInteger)numberOfPageInPageScrollView:(BrandPageView *)brandPageView;

@optional
- (CGSize)sizeCellForPageScrollView:(BrandPageView *)brandPageView;
- (void)pageScrollView:(BrandPageView *)brandPageView didTapPageAtIndex:(NSInteger)index;
@end

@protocol BrandPageViewDataSource <UIScrollViewDelegate>

@required
- (BrandPageViewCell *)pageScrollView:(BrandPageView *)brandPageView viewForRowAtIndex:(NSInteger)index;
@end


@interface BrandPageView : UIScrollView

@property (nonatomic, weak) id<BrandPageViewDataSource> dataSource;
@property (nonatomic, weak) id<BrandPageViewDelegate> delegate;


@property (nonatomic,assign) CGFloat rightPadding; // 右边距属性, 默认是View宽度的1/10
@property (nonatomic,assign) CGFloat padding;      // 两个Cell之间的空隙距离,默认为10

- (void)reloadData; // 重新加载数据

@end
