//
//  UIDetailEvaluateView.m
//  QingCha
//
//  Created by eazytec on 15/12/14.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UIDetailEvaluateView.h"

@implementation UIDetailEvaluateView

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
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 8;
        self.layer.borderWidth = 0.0f;
        self.layer.borderColor = [[UIColor whiteColor] CGColor];
        
        // 头像
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Detail_Head_6"]];
        
        imageview.frame = CGRectMake(10,10,frame.size.height / 5 * 3,frame.size.height / 5 * 3);
        imageview.layer.masksToBounds = YES;
        imageview.layer.cornerRadius = CGRectGetHeight(imageview.bounds)/2;
        imageview.layer.borderWidth = 0.2f;
        imageview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        
        [self addSubview:imageview];
        
        // 名字
        UILabel *nameLabel = [[UILabel alloc]init];
        
        nameLabel.text = @"我是一只鱼";
        nameLabel.frame = CGRectMake(10 + frame.size.height / 5 * 3 + 10, 15 , 200, 15);
        nameLabel.font = [UIFont boldSystemFontOfSize:15];
        nameLabel.textColor = [UIColor colorWithRed:137.0 / 255.0 green:137.0 / 255.0 blue:137.0 / 255.0 alpha:1];
        
        nameLabel.numberOfLines = 1;
        nameLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        [self addSubview:nameLabel];
        
        
        // 日期
        UILabel *timeLabel = [[UILabel alloc]init];
        
        timeLabel.text = @"2015/12/25  23:15";
        timeLabel.frame = CGRectMake(10 + frame.size.height / 5 * 3 + 10, 15 + 15 + 5, 200, 10);
        timeLabel.font = [UIFont systemFontOfSize:10];
        timeLabel.textColor =[UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1];
        
        timeLabel.numberOfLines = 1;
        timeLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        [self addSubview:timeLabel];
        
        
        // 内容
        UILabel *detailLabel = [[UILabel alloc]init];
        
        detailLabel.text = @"正所谓人间似锦，春去秋来，若一幕幕繁华凋谢，试问如何不枉此生？";
        detailLabel.frame = CGRectMake(10 + frame.size.height / 5 * 3 + 10, 15 + 15 + 5 + 10 + 5 ,frame.size.width - (10 + frame.size.height / 5 * 3 + 10) - 10 , 30);
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textColor = [UIColor colorWithRed:137.0 / 255.0 green:137.0 / 255.0 blue:137.0 / 255.0 alpha:1];
        detailLabel.numberOfLines = 2;
        [self addSubview:detailLabel];
        
        // 评分
        UILabel *scoreLabel = [[UILabel alloc]init];
        
        scoreLabel.text = @"5分";
        scoreLabel.frame = CGRectMake(frame.size.width - 20 - 40, 20 , 40, 15);
        scoreLabel.font = [UIFont boldSystemFontOfSize:15];
        scoreLabel.textColor = [UIColor colorWithRed:137.0 / 255.0 green:137.0 / 255.0 blue:137.0 / 255.0 alpha:1];
        
        scoreLabel.numberOfLines = 1;
        scoreLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        scoreLabel.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:scoreLabel];
    
        
    }
    return self;
}

@end
