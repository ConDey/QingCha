//
//  UIBrandView.m
//  QingCha
//
//  Created by eazytec on 15/12/3.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UIBrandView.h"
#import "UIBrandBookView.h"

@implementation UIBrandView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andDetail:(NSString *)detail andImage:(NSString *)image {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [imageview setImage:[UIImage imageNamed:@"Brand_Bg"]];
        [self addSubview:imageview];
        
        // 创建BrandBook
        UIBrandBookView *brandBookView = [[UIBrandBookView alloc]initWithFrame:CGRectMake(0, 20, frame.size.width, frame.size.height - 50) andTitle:title andDetail:detail andImage:image];
        [self addSubview:brandBookView];
        
        // 新增单击事件
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [brandBookView addGestureRecognizer:recognizer];
        [recognizer setNumberOfTapsRequired:1];    // 1次点击
        [recognizer setNumberOfTouchesRequired:1]; // 1个手指操作
        
    }
    return self;
}

// 手势实现
- (void) handleSingleTap:(UITapGestureRecognizer *)recognizer{
    [self.delegate pushToProducts:@"有一家茶馆"];
}

@end
