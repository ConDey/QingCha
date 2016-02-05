//
//  ArtifactListViewCell.m
//  QingCha
//
//  Created by eazytec on 16/2/3.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "ArtifactListViewCell.h"

#define ARTIFACT_CELL_MARGIN   8
#define CELL_WIDTH  (SCREEN_WIDTH - ARTIFACT_CELL_MARGIN * 3)/2
#define CELL_HEIGHT CELL_WIDTH * 2

#define IMAGE_VIEW_INDEX_X  0
#define IMAGE_VIEW_INDEX_Y  0
#define IMAGE_VIEW_WIDTH    CELL_WIDTH
#define IMAGE_VIEW_HEIGHT   CELL_HEIGHT * 0.7

#define TITLE_LABEL_INDEX_X 10
#define TITLE_LABEL_INDEX_Y IMAGE_VIEW_INDEX_Y + IMAGE_VIEW_HEIGHT + 15
#define TITLE_LABEL_WIDTH   CELL_WIDTH - TITLE_LABEL_INDEX_X * 2
#define TITLE_LABEL_HEIGHT  15

#define INTRODUCTION_LABEL_INDEX_X TITLE_LABEL_INDEX_X
#define INTRODUCTION_LABEL_INDEX_Y (TITLE_LABEL_INDEX_Y + TITLE_LABEL_HEIGHT) + 5
#define INTRODUCTION_LABEL_WIDTH   CELL_WIDTH -  INTRODUCTION_LABEL_INDEX_X * 2
#define INTRODUCTION_LABEL_HEIGHT  CELL_HEIGHT - (INTRODUCTION_LABEL_INDEX_Y) - 10

@implementation ArtifactListViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        self.layer.borderWidth = 0;
        
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.introductionLabel];
    }
    return self;
}

#pragma mark 属性

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(IMAGE_VIEW_INDEX_X, IMAGE_VIEW_INDEX_Y, IMAGE_VIEW_WIDTH, IMAGE_VIEW_HEIGHT)];
        CAShapeLayer *styleLayer = [CAShapeLayer layer];
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:_imageView.bounds byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(10.0, 10.0)];
        styleLayer.path = shadowPath.CGPath;
        _imageView.layer.mask = styleLayer;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(TITLE_LABEL_INDEX_X, TITLE_LABEL_INDEX_Y, TITLE_LABEL_WIDTH, TITLE_LABEL_HEIGHT)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = UI_TITLE_COLOR;
        _titleLabel.numberOfLines = 1;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}

- (UILabel *)introductionLabel {
    if (_introductionLabel == nil) {
       _introductionLabel = [[UILabel alloc]initWithFrame:CGRectMake(INTRODUCTION_LABEL_INDEX_X, INTRODUCTION_LABEL_INDEX_Y, INTRODUCTION_LABEL_WIDTH, INTRODUCTION_LABEL_HEIGHT)];
        _introductionLabel.font = [UIFont systemFontOfSize:10];
        _introductionLabel.textColor = UI_INTRODUCTION_COLOR;
        _introductionLabel.numberOfLines = 0;
        _introductionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _introductionLabel.textAlignment = NSTextAlignmentJustified;
    }
    return _introductionLabel;
}

#pragma mark 类方法

+ (CGFloat)width {
    return CELL_WIDTH;
}

+ (CGFloat)height {
    return CELL_HEIGHT;
}

@end
