//
//  DetailEvaluateTableViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/14.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "DetailEvaluateTableViewCell.h"

#import "UIConstranits.h"
#import "UIDetailEvaluateView.h"

@implementation DetailEvaluateTableViewCell

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
        self.backgroundColor = [UIColor clearColor];
        
        UIDetailEvaluateView *evaluateview = [[UIDetailEvaluateView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 90)];
        [self addSubview:evaluateview];
    }
    return self;
    
}

@end
