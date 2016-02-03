//
//  ArtifactHeadViewCell.m
//  QingCha
//
//  Created by eazytec on 16/2/3.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "ArtifactHeadViewCell.h"

#define ARTIFACT_CELL_MARGIN   8
#define CELL_WIDTH  (SCREEN_WIDTH - ARTIFACT_CELL_MARGIN * 3)/2
#define CELL_HEIGHT (CELL_WIDTH * 5/3)/2

#define IMAGE_VIEW_INDEX_X  0
#define IMAGE_VIEW_INDEX_Y  0
#define IMAGE_VIEW_WIDTH    CELL_WIDTH
#define IMAGE_VIEW_HEIGHT   CELL_HEIGHT

@implementation ArtifactHeadViewCell

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

#pragma mark 类方法

+ (CGFloat)width {
    return CELL_WIDTH;
}

+ (CGFloat)height {
    return CELL_HEIGHT;  // 5/3是根据宽度的系数
}

@end
