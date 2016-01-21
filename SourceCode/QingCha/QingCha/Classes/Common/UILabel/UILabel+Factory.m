//
//  UILabel+factory.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "UILabel+Factory.h"

@implementation UILabel (Factory)

+ (instancetype)tagLabel {
    UILabel *tagLabel = [[UILabel alloc]init];
    tagLabel.font = [UIFont systemFontOfSize:12];
    tagLabel.textColor = UI_GREP_COLOR;
    tagLabel.numberOfLines = 1;
    tagLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
    tagLabel.layer.cornerRadius = 10;
    tagLabel.layer.borderColor = UI_GREP_COLOR.CGColor;
    tagLabel.layer.borderWidth = 1;
    tagLabel.textAlignment = NSTextAlignmentCenter;
    return tagLabel;
}

@end
