//
//  BrandView.m
//  QingCha
//
//  Created by eazytec on 16/1/28.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "BrandView.h"

@implementation BrandView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_Brand_Scroll_Bg.jpg"]]];
        self.clipsToBounds = YES;
        self.brandPageView = [[BrandPageView alloc]initWithFrame:CGRectMake(0,
                                                                            0,
                                                                            frame.size.width - frame.size.width/RIGHT_VIEW_CELL_RATIO,
                                                                            frame.size.height)];
        [self addSubview:self.brandPageView];
    }
    return self;
}

@end
