//
//  UICommonViewController.h
//  QingCha
//
//  Created by eazytec on 16/1/11.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <UIKit/UIKit.h>


// 标准的公共CommonViewController基类

@interface UICommonViewController : UIViewController

@property (nonatomic,retain) UITableView *tableview;

@property (nonatomic,assign) BOOL isNavBarShow; // NavBar是否存在,默认存在

@end
