//
//  UIDetailEvaluateBtnView.m
//  QingCha
//
//  Created by eazytec on 15/12/17.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UIDetailEvaluateBtnView.h"

#import "UIConstranits.h"

@implementation UIDetailEvaluateBtnView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Detail_Evaluate_Btn"]];
        imageview.frame = CGRectMake(SCREEN_WIDTH/3 , 7.5, SCREEN_WIDTH/3 , 30);
        imageview.userInteractionEnabled = YES;
        [self addSubview:imageview];
        
        // 新增单击事件
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [imageview addGestureRecognizer:recognizer];
        [recognizer setNumberOfTapsRequired:1];    // 1次点击
        [recognizer setNumberOfTouchesRequired:1]; // 1个手指操作
        
        
    }
    return self;
}

// 手势实现
- (void) handleSingleTap:(UITapGestureRecognizer *)recognizer{
    [self.delegate pushToEvaluate];
}

@end
