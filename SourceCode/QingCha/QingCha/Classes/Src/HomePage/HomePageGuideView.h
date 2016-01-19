//
//  HomePageNavigationView.h
//  QingCha
//
//  Created by eazytec on 16/1/15.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <UIKit/UIKit.h>

//  首页导航菜单

@interface HomePageGuideView : UIView

@property (nonatomic,retain) UIImageView *logoImageView;
@property (nonatomic,retain) UISegmentedControl *segmentedControl; // 导航菜单标题

// 初始化方法
- (id) initWithFrame:(CGRect)frame andSegmentedData:(NSArray *)arrays;

@end
