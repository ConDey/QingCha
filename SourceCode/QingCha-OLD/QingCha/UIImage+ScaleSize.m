//
//  UIImage+ScaleSize.m
//  QingCha
//
//  Created by eazytec on 15/12/9.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UIImage+ScaleSize.h"

@implementation UIImage (ScaleSize)


// 适配图片至相应的比例
- (UIImage *)scaleToSize:(CGSize)size{
    
    UIGraphicsBeginImageContext(size); // 创建一个bitmap的context,并把它设置成为当前正在使用的context
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)]; // 绘制改变大小的图片
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext(); // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

@end
