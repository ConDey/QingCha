//
//  UIBrandView.m
//  QingCha
//
//  Created by eazytec on 15/12/3.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UIBrandBookView.h"

@implementation UIBrandBookView


- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andDetail:(NSString *)detail andImage:(NSString *)image {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 插入背景图片,是一本书
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width, frame.size.height)];
        imageView.image = [UIImage imageNamed:@"Brand_Book"];
        [self addSubview:imageView];
        
        // 插入标题
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = title;
        titleLabel.frame = CGRectMake(frame.size.width - 230, frame.size.height / 12, 200, 20);
        
        // 设置字体:粗体，正常的是 SystemFontOfSize
        titleLabel.font = [UIFont boldSystemFontOfSize:21];
        
        // 设置文字的颜色
        titleLabel.textColor = [UIColor colorWithRed:38.0 / 255.0 green:37.0 / 255.0 blue:37.0 / 255.0 alpha:1];
        
        titleLabel.numberOfLines = 1;
        titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        titleLabel.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:titleLabel];
        
        // 插入图片
        UIImageView *detailImageView =  [[UIImageView alloc] initWithFrame:CGRectMake(45, frame.size.height/6 ,frame.size.width - 60, frame.size.height / 5 * 3)];
        detailImageView.image = [UIImage imageNamed:image];
        [self addSubview:detailImageView];

        // 插入分隔符
        UIView *grepUIView = [[UIView alloc] initWithFrame:CGRectMake(55, frame.size.height/6 + frame.size.height/5 * 3 + 10, frame.size.width - 80, 1)];
        grepUIView.backgroundColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1];
        [self addSubview: grepUIView];
        
    
        // 插入简介
        UILabel *detailLabel = [[UILabel alloc]init];
        detailLabel.text = detail;
        detailLabel.frame = CGRectMake(45, frame.size.height/6 + frame.size.height/5 * 3 + 20, frame.size.width - 60, 48);

        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textColor = [UIColor colorWithRed:137.0 / 255.0 green:137.0 / 255.0 blue:137.0 / 255.0 alpha:1];
        
        detailLabel.numberOfLines = 3;
        detailLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self addSubview:detailLabel];
        
        
    }
    return self;
}

@end
