//
//  MainNavigationController.h
//  QingCha
//
//  Created by eazytec on 15/12/21.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ICSDrawerController.h"

@interface MainNavigationController : UINavigationController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property(nonatomic, weak) ICSDrawerController *drawer;

@end
