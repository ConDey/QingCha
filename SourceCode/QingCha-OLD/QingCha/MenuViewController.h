//
//  MenuViewController.h
//  QingCha
//
//  Created by eazytec on 15/12/21.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ICSDrawerController.h"

@protocol MenuViewControllerDelegate <NSObject>

- (void) pushToSegues: (NSString *)segue; // 跳转至相关segue

@end


@interface MenuViewController : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting, UITableViewDelegate, UITableViewDataSource >

@property(nonatomic, weak) ICSDrawerController *drawer;

@property (nonatomic, assign) id<MenuViewControllerDelegate> delegate;

@end
