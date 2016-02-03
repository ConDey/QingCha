//
//  BrandPageViewCell.m
//  QingCha
//
//  Created by eazytec on 16/1/26.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "BrandPageViewCell.h"

@implementation BrandPageViewCell

- (id)init {
    self = [super init];
    if (self) {
        [self addSubview:self.bgimageview];
        [self addSubview:self.titlelabel];
        [self addSubview:self.imageview];
        [self addSubview:self.transverse];
        [self addSubview:self.introductionlabel];
    }
    return self;
}

- (UIImageView *)bgimageview {
    if (_bgimageview == nil) {
        _bgimageview = [[UIImageView alloc]init];
        _bgimageview.image = [UIImage imageNamed:@"Home_Brand_Bg"];
        _bgimageview.contentMode = UIViewContentModeScaleToFill;
    }
    return _bgimageview;
}

- (UILabel *)titlelabel {
    if (_titlelabel == nil) {
        _titlelabel = [[UILabel alloc]init];
        _titlelabel.font = [UIFont systemFontOfSize:23];
        _titlelabel.textColor = UI_TITLE_COLOR;
        _titlelabel.numberOfLines = 1;
        _titlelabel.lineBreakMode = NSLineBreakByTruncatingTail;  //截去尾部
        _titlelabel.textAlignment = NSTextAlignmentRight;
    }
    return _titlelabel;
}

- (UIImageView *)imageview {
    if (_imageview == nil) {
        _imageview = [[UIImageView alloc]init];
        _imageview.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageview;
}

- (UILabel *)introductionlabel {
    if (_introductionlabel == nil) {
        _introductionlabel = [[UILabel alloc]init];
        _introductionlabel.font = [UIFont systemFontOfSize:12];
        _introductionlabel.textColor = UI_INTRODUCTION_COLOR;
        _introductionlabel.numberOfLines = 0;
        _introductionlabel.lineBreakMode = NSLineBreakByCharWrapping;
        _introductionlabel.textAlignment = NSTextAlignmentJustified;
    }
    return _introductionlabel;
}

- (UIView *)transverse {
    if (_transverse == nil) {
        _transverse = [[UIView alloc]init];
        _transverse.backgroundColor = UI_GREP_COLOR;
    }
    return _transverse;
}

@end
