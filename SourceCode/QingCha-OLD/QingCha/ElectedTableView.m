//
//  RecommendTableView.m
//  QingCha
//
//  Created by eazytec on 15/12/2.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "ElectedTableView.h"

@implementation ElectedTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style  {
    if (self = [super initWithFrame:frame style:style]) {
        
        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsZero];
        }
        
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            [self setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return self;
}
@end
