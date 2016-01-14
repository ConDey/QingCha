//
//  UIImage+ScaleSize.h
//  QingCha
//
//  Created by eazytec on 15/12/9.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ScaleSize)

// 适配图片至相应的比例
- (UIImage *)scaleToSize:(CGSize)size;

@end
