//
//  DetailInterestedTableViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/14.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "DetailInterestedTableViewCell.h"

#import "UIConstranits.h"

@implementation DetailInterestedTableViewCell

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
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH, 14)];
        titleLabel.text = @"这些人也喜欢";
        
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor colorWithRed:137.0 / 255.0 green:137.0 / 255.0 blue:137.0 / 255.0 alpha:1];
        
        titleLabel.numberOfLines = 1;
        titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        [self.contentView addSubview:titleLabel];
        
        int num = 6;
        
        for (int index = 0; index < num; index++) {
            
            NSString *imageurl = [[NSString alloc]init];
            if (index == 0)      {imageurl = @"Detail_Head_1"; }
            else if (index == 1) {imageurl = @"Detail_Head_2"; }
            else if (index == 2) {imageurl = @"Detail_Head_3"; }
            else if (index == 3) {imageurl = @"Detail_Head_4"; }
            else if (index == 4) {imageurl = @"Detail_Head_5"; }
            else if (index == 5) {imageurl = @"Detail_Head_6"; }
            
            UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageurl]];
            
            imageview.frame = CGRectMake(20 + (SCREEN_WIDTH-40)/6 * index, 10 + 14 + 10,(SCREEN_WIDTH-40)/6 - 10, (SCREEN_WIDTH-40)/6 - 10);
            imageview.layer.masksToBounds = YES;
            imageview.layer.cornerRadius = CGRectGetHeight(imageview.bounds)/2;
            imageview.layer.borderWidth = 0.2f;
            imageview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            
            [self.contentView addSubview:imageview];
        }     
    }
    return self;
}

@end
