//
//  UITableView+Factory.h
//  QingCha
//
//  Created by eazytec on 16/1/19.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Factory)

//工厂方法
+ (instancetype)tableView;
+ (instancetype)groupTableView;

@end
