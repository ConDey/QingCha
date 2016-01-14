//
//  UIProductView.m
//  QingCha
//
//  Created by eazytec on 15/12/4.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UIProductView.h"


@implementation UIProductView

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
        
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        self.layer.borderWidth = 0;
        
        // 新增图片
        UIImageView* imageview = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"Brand_Detail"]];
        imageview.frame = CGRectMake(0, 0, frame.size.width, frame.size.height * 2 / 3);
        
        CAShapeLayer *styleLayer = [CAShapeLayer layer];
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:imageview.bounds byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(10.0, 10.0)];
        styleLayer.path = shadowPath.CGPath;
        imageview.layer.mask = styleLayer;
        
        [self addSubview:imageview];
        
        // 新增文字说明
        UILabel* titleLabel = [[UILabel alloc]init];
        titleLabel.frame = CGRectMake(10, frame.size.height * 2 / 3 + 15 , frame.size.width - 20, 16);
        titleLabel.text = @"野生云泥紫砂";
        
        titleLabel.font = [UIFont systemFontOfSize:16];
        
        // 设置文字的颜色
        titleLabel.textColor = [UIColor colorWithRed:38.0 / 255.0 green:37.0 / 255.0 blue:37.0 / 255.0 alpha:1];
        
        titleLabel.numberOfLines = 1;
        titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        [self addSubview:titleLabel];
        
        // 新增文字说明
        UILabel* detailLabel = [[UILabel alloc]init];
        detailLabel.frame = CGRectMake(10, frame.size.height * 2 / 3 + 40 , frame.size.width - 20, frame.size.height - (frame.size.height * 2 / 3 + 40) - 15 );
        detailLabel.text = @"自古秋访云端, 一墨一遥, 寒之将至, 千里之赤, 赤水之寒, 以为泉之大者, 乃夯也。";
        
        detailLabel.font = [UIFont systemFontOfSize:10];
        
        // 设置文字的颜色
        detailLabel.textColor = [UIColor colorWithRed:137.0 / 255.0 green:137.0 / 255.0 blue:137.0 / 255.0 alpha:1];
        detailLabel.numberOfLines = 0;
        detailLabel.lineBreakMode = NSLineBreakByWordWrapping;  //截去尾部
        [self addSubview:detailLabel];

        
    }
    return self;
}


@end
