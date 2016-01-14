//
//  UIBrandScrollView.m
//  QingCha
//
//  Created by eazytec on 15/12/4.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UIBrandScrollView.h"

#import "UIBrandView.h"

@interface UIBrandScrollView ()


@end

@implementation UIBrandScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame andTarget:(id)target {
    
    self = [super initWithFrame:frame];
    if (self) {
        int num = 4;
        [self setContentSize:CGSizeMake((num - 1) * frame.size.width * 9 / 10 + frame.size.width * 1 / 10 , frame.size.height)];
        [self setBounces:NO];
        
        for (int index = 0; index < num; index++) {
          UIBrandView *brandView = [[UIBrandView alloc]initWithFrame:CGRectMake(index * (frame.size.width * 9 / 10), 0, frame.size.width * 9 / 10, frame.size.height) andTitle:@"有一间茶馆" andDetail:@"紫砂器的泥色有多种，除去主要的朱泥、紫砂泥外，尚有白泥、乌泥、黄泥、松花泥等各种色泽，紫砂器面还具有亚光效果，既可减弱光能的反射，又能清晰地表现器物形态、装饰与自身天然色泽的生动效果。" andImage:@"Brand_Detail"];
          brandView.delegate = target;
          [self addSubview:brandView];
            
        }
        //滚动时是否水平显示滚动条
        [self setShowsHorizontalScrollIndicator:NO];
    }
    return self;
}

@end
