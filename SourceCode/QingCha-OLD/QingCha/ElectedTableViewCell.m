//
//  ElectedTableViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/2.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "ElectedTableViewCell.h"
#import "UIConstranits.h"

CGFloat const IMAGE_TITLE_INTERVAL = 15.0;
CGFloat const TITLE_DETAIL_INTERVAL = 14.0;
CGFloat const TITLE_TAB_INTERVAL = 10.0;

CGFloat const LABEL_X_INTERVAL = 12.0;

@implementation ElectedTableViewCell

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
        
        // 1.绘制图片
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Elected_Image"]];
        imageview.contentMode = UIViewContentModeScaleToFill;
        imageview.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 2/3);
        [self addSubview:imageview];
        
        // 2.绘制标题
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.frame = CGRectMake(LABEL_X_INTERVAL, SCREEN_WIDTH * 2/3 + IMAGE_TITLE_INTERVAL, SCREEN_WIDTH - 24, 14);
        titleLabel.text = @"仙果人间都未有，今朝忽见天下门";
        
        // 设置字体:粗体，正常的是 SystemFontOfSize
        titleLabel.font = [UIFont systemFontOfSize:14];
        
        // 设置文字的颜色
        titleLabel.textColor = [UIColor colorWithRed:38.0 / 255.0 green:37.0 / 255.0 blue:37.0 / 255.0 alpha:1];
        
        titleLabel.numberOfLines = 1;
        titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        
        [self addSubview:titleLabel];
        
        // 3.绘制简介
        UILabel *detailLabel = [[UILabel alloc]init];
        detailLabel.frame = CGRectMake(LABEL_X_INTERVAL, SCREEN_WIDTH * 2/3 + IMAGE_TITLE_INTERVAL + 14 + TITLE_DETAIL_INTERVAL, SCREEN_WIDTH - 24, 13);
        detailLabel.text = @"唐代张籍有诗曰: 仙果人间都未有，今朝忽见天下门。";
        
        // 设置字体:粗体，正常的是 SystemFontOfSize
        detailLabel.font = [UIFont systemFontOfSize:13];
        
        // 设置文字的颜色
        detailLabel.textColor = [UIColor colorWithRed:137.0 / 255.0 green:137.0 / 255.0 blue:137.0 / 255.0 alpha:1];
        
        detailLabel.numberOfLines = 1;
        detailLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        
        [self addSubview:detailLabel];
        
        // 4.绘制标签
        // 作者
        NSString *authorText = @"张释之";
        NSDictionary *authorTextSizeAttirbute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
        CGSize authorTextSize = [authorText boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine attributes:authorTextSizeAttirbute context:nil].size;
        CGFloat authorTextSizeWidth = authorTextSize.width + 15;
        
        UILabel *authorLabel = [[UILabel alloc]init];
        authorLabel.text = authorText;
        authorLabel.frame = CGRectMake(LABEL_X_INTERVAL, SCREEN_WIDTH * 2/3 + IMAGE_TITLE_INTERVAL + 14 + TITLE_DETAIL_INTERVAL + 13 + TITLE_TAB_INTERVAL, authorTextSizeWidth, 18);

        authorLabel.font = [UIFont systemFontOfSize:12];
        
        // 设置文字的颜色
        authorLabel.textColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1];
        
        authorLabel.numberOfLines = 1;
        authorLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        authorLabel.layer.cornerRadius = 10;
        authorLabel.layer.borderColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1].CGColor;
        authorLabel.layer.borderWidth = 1;
        authorLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:authorLabel];
        
        
        // 品牌
        NSString *brandText = @"清茶绮香";
        NSDictionary *brandTextSizeAttirbute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
        CGSize brandTextSize = [brandText boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine attributes:brandTextSizeAttirbute context:nil].size;
        CGFloat brandTextSizeWidth = brandTextSize.width + 15;
        
        UILabel *brandLabel = [[UILabel alloc]init];
        brandLabel.text = brandText;
        brandLabel.frame = CGRectMake(LABEL_X_INTERVAL + 6 + authorTextSizeWidth  , SCREEN_WIDTH * 2/3 + IMAGE_TITLE_INTERVAL + 14 + TITLE_DETAIL_INTERVAL + 13 + TITLE_TAB_INTERVAL, brandTextSizeWidth, 18);
        
        brandLabel.font = [UIFont systemFontOfSize:12];
        
        // 设置文字的颜色
        brandLabel.textColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1];
        
        brandLabel.numberOfLines = 1;
        brandLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        brandLabel.layer.cornerRadius = 10;
        brandLabel.layer.borderColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1].CGColor;
        brandLabel.layer.borderWidth = 1;
        brandLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:brandLabel];
        
        
        //5. 评价
        UILabel *evalLabel = [[UILabel alloc]init];
        evalLabel.text = @"1368人已鉴赏";
        evalLabel.frame = CGRectMake( SCREEN_WIDTH - 12 - 100, SCREEN_WIDTH * 2/3 + IMAGE_TITLE_INTERVAL + 14 + TITLE_DETAIL_INTERVAL + 13 + TITLE_TAB_INTERVAL, 100 , 18);
        evalLabel.font = [UIFont systemFontOfSize:12];
        
        evalLabel.textAlignment = NSTextAlignmentRight;
        evalLabel.textColor = [UIColor colorWithRed:201.0 / 255.0 green:201.0 / 255.0 blue:201.0 / 255.0 alpha:1];
        [self addSubview:evalLabel];
    }
    return self;
}

@end
