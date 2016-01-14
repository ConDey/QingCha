//
//  UIDetailEvaluateBtnView.h
//  QingCha
//
//  Created by eazytec on 15/12/17.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIDetailEvaluateBtnViewDelegate <NSObject>

- (void) pushToEvaluate;

@end

@interface UIDetailEvaluateBtnView : UIView

@property (nonatomic, assign) id<UIDetailEvaluateBtnViewDelegate> delegate;

@end
