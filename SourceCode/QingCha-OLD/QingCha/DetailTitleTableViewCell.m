//
//  DetailTitleTableViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/12.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "DetailTitleTableViewCell.h"

#import "UIConstranits.h"

@implementation DetailTitleTableViewCell

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
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 标题
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH , 20)];
        titleLabel.text = @"飘香如雪，十里皆白";
        
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textColor = [UIColor colorWithRed:38.0 / 255.0 green:37.0 / 255.0 blue:37.0 / 255.0 alpha:1];
        
        titleLabel.numberOfLines = 1;
        titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        
        [self.contentView addSubview:titleLabel];
        
        
        // 评分背景图
        UIImageView *scoreBg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Detail_Score"]];
        scoreBg.frame = CGRectMake(SCREEN_WIDTH - 40 - 46, 20, 46, 46);
        
        [self.contentView addSubview:scoreBg];
        
        // 当前评分
        UILabel *scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 40 - 46 - 18, 20, 100, 25)];
        
        scoreLabel.text = @"4.9";
        scoreLabel.font = [UIFont fontWithName:@"PingFangSC-Thin" size:25];
        //scoreLabel.font = [UIFont systemFontOfSize:25];
        scoreLabel.textColor = [UIColor colorWithRed:108.0 / 255.0 green:35.0 / 255.0 blue:35.0 / 255.0 alpha:1];
        scoreLabel.numberOfLines = 1;
        scoreLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        scoreLabel.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:scoreLabel];
        
        // 作者
        NSString *authorText = @"张释之";
        NSDictionary *authorTextSizeAttirbute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
        CGSize authorTextSize = [authorText boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine attributes:authorTextSizeAttirbute context:nil].size;
        CGFloat authorTextSizeWidth = authorTextSize.width + 15;
        
        UILabel *authorLabel = [[UILabel alloc]init];
        authorLabel.text = authorText;
        authorLabel.frame = CGRectMake(20, 20 + 18 + 10, authorTextSizeWidth, 18);
        
        authorLabel.font = [UIFont systemFontOfSize:12];
        authorLabel.textColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1];
        
        authorLabel.numberOfLines = 1;
        authorLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        authorLabel.layer.cornerRadius = 10;
        authorLabel.layer.borderColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1].CGColor;
        authorLabel.layer.borderWidth = 1;
        authorLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview: authorLabel];
        
        
        // 品牌
        NSString *brandText = @"清茶绮香";
        NSDictionary *brandTextSizeAttirbute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
        CGSize brandTextSize = [brandText boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine attributes:brandTextSizeAttirbute context:nil].size;
        CGFloat brandTextSizeWidth = brandTextSize.width + 15;
        
        UILabel *brandLabel = [[UILabel alloc]init];
        brandLabel.text = brandText;
        brandLabel.frame = CGRectMake(20 + 6 + authorTextSizeWidth , 20 + 18 + 10, brandTextSizeWidth, 18);
        
        brandLabel.font = [UIFont systemFontOfSize:12];
        brandLabel.textColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1];
        
        brandLabel.numberOfLines = 1;
        brandLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        brandLabel.layer.cornerRadius = 10;
        brandLabel.layer.borderColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1].CGColor;
        brandLabel.layer.borderWidth = 1;
        brandLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview: brandLabel];
        
        //  产地
        NSString *bothText = @"江苏宜兴";
        NSDictionary *bothTextSizeAttirbute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
        CGSize bothTextSize = [brandText boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine attributes:bothTextSizeAttirbute context:nil].size;
        CGFloat bothTextSizeWidth = bothTextSize.width + 15;
        
        UILabel *bothLabel = [[UILabel alloc]init];
        bothLabel.text = bothText;
        bothLabel.frame = CGRectMake(20 + 6 + authorTextSizeWidth + brandTextSizeWidth + 6 , 20 + 18 + 10, bothTextSizeWidth, 18);
        
        bothLabel.font = [UIFont systemFontOfSize:12];
        bothLabel.textColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1];
        
        bothLabel.numberOfLines = 1;
        bothLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        bothLabel.layer.cornerRadius = 10;
        bothLabel.layer.borderColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1].CGColor;
        bothLabel.layer.borderWidth = 1;
        bothLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview: bothLabel];
        
        // 设置评分
        
        // 简介
        NSString *detailText = @"紫砂陶土的成因，属内陆湖泊及滨海湖沼相沉积矿床，通过外力沉积成矿，深埋于山腹之中。紫泥和绿泥都产于甲泥矿中。甲泥是一种脊性粘土，紫红色，色似铁甲，甲泥矿中甲泥储量最多，紫泥，绿泥储量较少，紫泥仅占总储量的3-4%。";
        NSDictionary *detailTextSizeAttirbute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
        CGSize detailTextSize = [detailText boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 30, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin attributes:detailTextSizeAttirbute context:nil].size;
        CGFloat detailTextSizeHeight = detailTextSize.height;
        
        UILabel *detailLabel = [[UILabel alloc]init];
        detailLabel.text = detailText;
        detailLabel.frame = CGRectMake(20, 20 + 18 + 10 + 18 + 10, SCREEN_WIDTH - 40, detailTextSizeHeight);
        
        detailLabel.font = [UIFont systemFontOfSize:13];
        detailLabel.textColor = [UIColor colorWithRed:137.0 / 255.0 green:137.0 / 255.0 blue:137.0 / 255.0 alpha:1];
        
        detailLabel.numberOfLines = 0;
        detailLabel.lineBreakMode = NSLineBreakByCharWrapping;
        detailLabel.textAlignment = NSTextAlignmentLeft;
        
        detailLabel.adjustsFontSizeToFitWidth = YES;
        
        [self.contentView addSubview: detailLabel];
        
        // 浏览数
        UILabel *readLabel = [[UILabel alloc]init];
        readLabel.text = @"164次浏览";
        readLabel.frame = CGRectMake(20, 20 + 18 + 10 + 18 + 10 + detailTextSizeHeight + 30, 200, 12);
        
        readLabel.font = [UIFont systemFontOfSize:12];
        readLabel.textColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1];
        
        readLabel.numberOfLines = 1;
        readLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        readLabel.textAlignment = NSTextAlignmentLeft;

        [self.contentView addSubview: readLabel];
        
        // 评价数
        UILabel *evaluateLabel = [[UILabel alloc]init];
        evaluateLabel.text = @"72次评价";
        evaluateLabel.frame = CGRectMake(SCREEN_WIDTH - 20 - 100, 20 + 18 + 10 + 18 + 10 + detailTextSizeHeight + 30, 100, 12);
        
        evaluateLabel.font = [UIFont systemFontOfSize:12];
        evaluateLabel.textColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1];
        
        evaluateLabel.numberOfLines = 1;
        evaluateLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        evaluateLabel.textAlignment = NSTextAlignmentRight;
        
        [self.contentView addSubview: evaluateLabel];
    
    }
    return self;
}

@end
