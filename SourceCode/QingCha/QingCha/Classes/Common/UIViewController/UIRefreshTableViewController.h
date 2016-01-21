//
//  UIRefreshTableViewController.h
//  QingCha
//
//  Created by eazytec on 16/1/20.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIRefreshTableViewController : UICommonViewController

// 当前分页
@property (nonatomic,assign) NSInteger currentPage;

// 每页显示的数量
@property (nonatomic,assign) NSInteger pageSize;

// 数据总量
@property (nonatomic,assign) NSInteger totalCount;

// 页数总量
@property (nonatomic,assign) NSInteger totalPage;

@end
