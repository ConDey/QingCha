//
//  UserHeadTableViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/22.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UserHeadTableViewCell.h"

#import "UIConstranits.h"

@implementation UserHeadTableViewCell

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
        
        UIImageView *blankimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 3/5)];
        blankimage.image = [UIImage imageNamed:@"Products_Image4"];
        [self.contentView addSubview:blankimage];

        // 头像imageview
        UIImageView *headimage = [[UIImageView alloc]initWithFrame:CGRectMake(30, SCREEN_WIDTH * 3/5 - 40, 80, 80)];
        headimage.image = [UIImage imageNamed:@"Detail_Head_6"];
        headimage.layer.masksToBounds = YES;
        headimage.layer.cornerRadius = CGRectGetHeight(headimage.bounds)/2;
        headimage.layer.borderWidth = 2;
        headimage.layer.borderColor = [[UIColor whiteColor] CGColor];

        [self.contentView addSubview:headimage];
    }
    return  self;
}

@end
