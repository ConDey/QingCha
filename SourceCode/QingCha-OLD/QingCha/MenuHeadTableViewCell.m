//
//  MenuHeadTableViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/22.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "MenuHeadTableViewCell.h"

#import "UIConstranits.h"

@implementation MenuHeadTableViewCell

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
        
        UIImageView *headimage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 30, 80, 80)];
        headimage.image = [UIImage imageNamed:@"Detail_Head_6"];
        headimage.layer.masksToBounds = YES;
        headimage.layer.cornerRadius = CGRectGetHeight(headimage.bounds)/2;
        headimage.layer.borderWidth = 0.2f;
        headimage.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        
        [self.contentView addSubview:headimage];
        
        UILabel *headName = [[UILabel alloc]initWithFrame:CGRectMake(120, 60, 100, 20)];
        headName.text = @"落叶离殇";
        
        headName.font = [UIFont boldSystemFontOfSize:20];
        headName.textColor = [UIColor whiteColor];
        headName.numberOfLines = 1;
        headName.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview: headName];
        
        // 再做一个横线吧
        // 绘制线条
        UIView *sectionview = [[UIView alloc] initWithFrame:CGRectMake(20, 138.5, SCREEN_WIDTH - 30, 1.5)];
        sectionview.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview: sectionview];
    }
    return  self;
}

@end
