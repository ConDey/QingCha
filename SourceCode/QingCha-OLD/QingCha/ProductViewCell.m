//
//  ProductViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/9.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "ProductViewCell.h"

@implementation ProductViewCell


- (id)initWithFrame:(CGRect)frame  {
    
    if (self = [super initWithFrame:frame]) {
        
        self.view = [[UIProductView alloc]initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:self.view];
    }
    return self;
}


@end
