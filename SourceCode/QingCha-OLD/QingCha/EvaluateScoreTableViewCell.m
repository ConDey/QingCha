//
//  EvaluateScoreViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/17.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "EvaluateScoreTableViewCell.h"

#import "UIConstranits.h"

@interface EvaluateScoreTableViewCell ()

@property (nonatomic,assign) int star1_index;
@property (nonatomic,assign) int star2_index;
@property (nonatomic,assign) int star3_index;
@property (nonatomic,assign) int star4_index;
@property (nonatomic,assign) int star5_index;

@property (nonatomic,retain) UIImageView *star1;
@property (nonatomic,retain) UIImageView *star2;
@property (nonatomic,retain) UIImageView *star3;
@property (nonatomic,retain) UIImageView *star4;
@property (nonatomic,retain) UIImageView *star5;

@end

@implementation EvaluateScoreTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, 80, 14)];
        titleLabel.text = @"我的评分:";
        
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor colorWithRed:137.0 / 255.0 green:137.0 / 255.0 blue:137.0 / 255.0 alpha:1];
        
        titleLabel.numberOfLines = 1;
        titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        
        [self.contentView addSubview:titleLabel];
        
        //1.星
        _star1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Evaluate_Nor"]];
        _star1.contentMode = UIViewContentModeScaleToFill;
        _star1.frame = CGRectMake(85, 0, 14, 14);
        _star1.userInteractionEnabled = YES;
        
        self.star1_index = 0;
        [self.contentView addSubview:_star1];
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapStar1:)];
        [_star1 addGestureRecognizer:recognizer];
        [recognizer setNumberOfTapsRequired:1];    // 1次点击
        [recognizer setNumberOfTouchesRequired:1]; // 1个手指操作
        
        //2.星
        _star2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Evaluate_Nor"]];
        _star2.contentMode = UIViewContentModeScaleToFill;
        _star2.frame = CGRectMake(104, 0, 14, 14);
        _star2.userInteractionEnabled = YES;
        
        self.star2_index = 0;
        [self.contentView addSubview:_star2];
        
        UITapGestureRecognizer *recognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapStar2:)];
        [_star2 addGestureRecognizer:recognizer2];
        [recognizer2 setNumberOfTapsRequired:1];    // 1次点击
        [recognizer2 setNumberOfTouchesRequired:1]; // 1个手指操作
        
        //3.星
        _star3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Evaluate_Nor"]];
        _star3.contentMode = UIViewContentModeScaleToFill;
        _star3.frame = CGRectMake(123, 0, 14, 14);
        _star3.userInteractionEnabled = YES;
        
        self.star3_index = 0;
        [self.contentView addSubview:_star3];
        
        UITapGestureRecognizer *recognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapStar3:)];
        [_star3 addGestureRecognizer:recognizer3];
        [recognizer3 setNumberOfTapsRequired:1];    // 1次点击
        [recognizer3 setNumberOfTouchesRequired:1]; // 1个手指操作
        
        //4.星
        _star4 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Evaluate_Nor"]];
        _star4.contentMode = UIViewContentModeScaleToFill;
        _star4.frame = CGRectMake(142, 0, 14, 14);
        _star4.userInteractionEnabled = YES;
        
        self.star4_index = 0;
        [self.contentView addSubview:_star4];
        
        UITapGestureRecognizer *recognizer4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapStar4:)];
        [_star4 addGestureRecognizer:recognizer4];
        [recognizer4 setNumberOfTapsRequired:1];    // 1次点击
        [recognizer4 setNumberOfTouchesRequired:1]; // 1个手指操作

        //5.星
        _star5 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Evaluate_Nor"]];
        _star5.contentMode = UIViewContentModeScaleToFill;
        _star5.frame = CGRectMake(161, 0, 14, 14);
        _star5.userInteractionEnabled = YES;
        
        self.star5_index = 0;
        [self.contentView addSubview:_star5];
        
        UITapGestureRecognizer *recognizer5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapStar5:)];
        [_star5 addGestureRecognizer:recognizer5];
        [recognizer5 setNumberOfTapsRequired:1];    // 1次点击
        [recognizer5 setNumberOfTouchesRequired:1]; // 1个手指操作
    }
    return  self;
}


// 手势实现
- (void) handleSingleTapStar1:(UITapGestureRecognizer *)recognizer{
    
    _star1.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star2.image = [UIImage imageNamed:@"Evaluate_Nor"];
    _star3.image = [UIImage imageNamed:@"Evaluate_Nor"];
    _star4.image = [UIImage imageNamed:@"Evaluate_Nor"];
    _star5.image = [UIImage imageNamed:@"Evaluate_Nor"];

}

// 手势实现
- (void) handleSingleTapStar2:(UITapGestureRecognizer *)recognizer{
    
    _star1.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star2.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star3.image = [UIImage imageNamed:@"Evaluate_Nor"];
    _star4.image = [UIImage imageNamed:@"Evaluate_Nor"];
    _star5.image = [UIImage imageNamed:@"Evaluate_Nor"];

}

// 手势实现
- (void) handleSingleTapStar3:(UITapGestureRecognizer *)recognizer{
    
    _star1.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star2.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star3.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star4.image = [UIImage imageNamed:@"Evaluate_Nor"];
    _star5.image = [UIImage imageNamed:@"Evaluate_Nor"];
}

// 手势实现
- (void) handleSingleTapStar4:(UITapGestureRecognizer *)recognizer{
    
    _star1.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star2.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star3.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star4.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star5.image = [UIImage imageNamed:@"Evaluate_Nor"];
}

// 手势实现
- (void) handleSingleTapStar5:(UITapGestureRecognizer *)recognizer{
    
    _star1.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star2.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star3.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star4.image = [UIImage imageNamed:@"Evaluate_Sel"];
    _star5.image = [UIImage imageNamed:@"Evaluate_Sel"];
}


@end
