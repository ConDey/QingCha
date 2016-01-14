//
//  ProductsHeadViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/9.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "ProductsHeadViewCell.h"

@implementation ProductsHeadViewCell


- (id)initWithFrame:(CGRect)frame  {
    
    if (self = [super initWithFrame:frame]) {  
        // 初始化headView
        self.headView = [[UIProductHeadView alloc]initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:self.headView];
    }
    return self;
}

@end
