//
//  UIBrandView.h
//  QingCha
//
//  Created by eazytec on 15/12/3.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIBrandViewDelegate <NSObject>

- (void) pushToProducts: (NSString *)NoOfProducts; // 跳转至ProductsView

@end

@interface UIBrandView : UIView

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andDetail:(NSString *)detail andImage:(NSString *)image;

@property (nonatomic, assign) id<UIBrandViewDelegate> delegate;

@end


