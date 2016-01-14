//
//  MenuTableViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/22.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

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
        
        self.headImageview = [[UIImageView alloc]initWithFrame:CGRectMake(30, 20, 40, 40)];
        self.headImageview.layer.masksToBounds = YES;
        self.headImageview.layer.cornerRadius = CGRectGetHeight(self.headImageview.bounds)/2;
        self.headImageview.layer.borderWidth = 0.2f;
        self.headImageview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        
        [self.contentView addSubview:self.headImageview];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 30, 100, 18)];
        
        self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.numberOfLines = 1;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview: self.titleLabel];  
    }
    return  self;
}

@end
