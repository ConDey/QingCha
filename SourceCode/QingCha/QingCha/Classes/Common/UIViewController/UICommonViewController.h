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

@property (nonatomic,retain) UITableView *grouptableview;

@property (nonatomic,assign) BOOL isNavBarShow; // NavBar是否存在,默认存在

@property (nonatomic,retain) NSString *titleOfNav; //NavBar如果存在,设置标题

@property (nonatomic,assign) BOOL isCommonBackItems; // 是否设置为通用的backItem, 默认是

@end
