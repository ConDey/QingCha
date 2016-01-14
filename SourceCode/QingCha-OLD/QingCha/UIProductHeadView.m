//
//  UIProductHeadView.m
//  QingCha
//
//  Created by eazytec on 15/12/9.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UIProductHeadView.h"
#import "UIImage+ScaleSize.h"

@implementation UIProductHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        UIImageView* imageview = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"Products_Logo"]];
        imageview.frame = frame;
        imageview.layer.masksToBounds = YES;
        imageview.layer.cornerRadius = 10;
        imageview.layer.borderWidth = 0;
          
        [self addSubview:imageview];
    }
    return self;
}





@end
