//
//  UserTitleTableViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/22.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UserTitleTableViewCell.h"

#import "UIConstranits.h"

@implementation UserTitleTableViewCell

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
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 30, 200 ,20)];
        titleLabel.text = @"落叶离殇";
        
        titleLabel.font = [UIFont systemFontOfSize:20];
        titleLabel.textColor = [UIColor colorWithRed:38.0 / 255.0 green:37.0 / 255.0 blue:37.0 / 255.0 alpha:1];
        
        titleLabel.numberOfLines = 1;
        titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        
        [self.contentView addSubview:titleLabel];
        
        
        UILabel *msgLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 70, SCREEN_WIDTH - 70, 12)];
        msgLabel.text = @"\"落叶看不见繁华,只留下淡淡的忧伤,在这个陌生的城市,感谢清茶绮香与我相伴.\"";
        
        msgLabel.font = [UIFont systemFontOfSize:12];
        msgLabel.textColor = [UIColor colorWithRed:137.0 / 255.0 green:137.0 / 255.0 blue:137.0 / 255.0 alpha:1];
        
        msgLabel.numberOfLines = 1;
        msgLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        [self.contentView addSubview:msgLabel];
        
    }
    return  self;
}

@end
