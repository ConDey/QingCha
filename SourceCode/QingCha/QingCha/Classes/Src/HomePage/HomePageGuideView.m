//
//  HomePageNavigationView.m
//  QingCha
//
//  Created by eazytec on 16/1/15.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "HomePageGuideView.h"

#define LOGO_IMAGE_INDEX_X 20.0
#define LOGO_IMAGE_INDEX_Y 29.0
#define LOGO_IMAGE_WIDTH   25.0
#define LOGO_IMAGE_HEIGHT  32.0

#define CONTROL_INDEX_Y    30.0
#define CONTROL_WIDTH      150.0
#define CONTROL_HEIGHT     30.0

#define TRANSVERSE_INDEX_X 0
#define TRANSVERSE_INDEX_Y frame.size.height - 1
#define TRANSVERSE_HEIGHT  0.5

@interface HomePageGuideView ()

@property (nonatomic,retain) UIView *transverse; // GuideView分割线

@end


@implementation HomePageGuideView

/**
 *    LogoImageView组件高度规则:
 *   ----------------------------------------
 *               |20:statusbar|
 *   ----------------------------------------
 *               |9|
 *   ----------------------------------------
 *               |32:logoimageview|
 *   ----------------------------------------
 *               |9|
 *   ----------------------------------------
 *
 *    SegmentedControl组件高度规则:
 *   ----------------------------------------
 *               |20:statusbar|
 *   ----------------------------------------
 *               |10|
 *   ----------------------------------------
 *               |30:segmentedcontrol|
 *   ----------------------------------------
 *               |10|
 *   ----------------------------------------
 */

- (id)initWithFrame:(CGRect)frame segmentedData:(NSArray *)arrays {
  
    self = [super initWithFrame:frame];
    if (self) {
        
        self.logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Home_Logo"]];
        self.logoImageView.frame = CGRectMake(LOGO_IMAGE_INDEX_X, LOGO_IMAGE_INDEX_Y, LOGO_IMAGE_WIDTH, LOGO_IMAGE_HEIGHT);
        self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.logoImageView.userInteractionEnabled = YES;
        [self addSubview:self.logoImageView];
        
        self.segmentedControl = [[UISegmentedControl alloc]initWithItems:arrays];
        
        CGFloat segmentx = (SCREEN_WIDTH - CONTROL_WIDTH) / 2;
        self.segmentedControl.frame = CGRectMake(segmentx, CONTROL_INDEX_Y, CONTROL_WIDTH, CONTROL_HEIGHT);
        self.segmentedControl.layer.cornerRadius  = 15.0;
        self.segmentedControl.layer.borderWidth   = 1.0f;
        self.segmentedControl.layer.masksToBounds = YES;
        
        // 这个是设置按下按钮时的颜色
        self.segmentedControl.tintColor = UI_BLACK_COLOR;
        self.segmentedControl.selectedSegmentIndex = 0;  // 默认选中的按钮索引

        // 下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等
        UIColor *fontUIColor = UI_BLACK_COLOR;
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName,fontUIColor, NSForegroundColorAttributeName, nil];
        [self.segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
        [self addSubview:self.segmentedControl];
        
        self.transverse = [[UIView alloc]initWithFrame:CGRectMake(TRANSVERSE_INDEX_X, TRANSVERSE_INDEX_Y, frame.size.width, TRANSVERSE_HEIGHT)];
        self.transverse.backgroundColor = UI_GREP_COLOR;
        self.transverse.layer.shadowOffset =  CGSizeMake(0,0.5);
        self.transverse.layer.shadowOpacity = 0.5;//阴影透明度，默认0
        self.transverse.layer.shadowRadius =  0.5;//阴影半径，默认3
        [self addSubview:self.transverse];
    }
    return self;
}

@end
