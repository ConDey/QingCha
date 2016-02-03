//
//  HomePageViewController.h
//  QingCha
//
//  Created by eazytec on 16/1/11.
//  Copyright © 2016年 QingCha. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "ElectionService.h"
#import "BrandService.h"

#import "BrandView.h"
#import "BrandPageView.h"
#import "BrandPageViewCell.h"

// QingCha 首页

@interface HomePageViewController : UIRefreshTableViewController<UITableViewDelegate,
                                                                 UITableViewDataSource,
                                                                 BrandPageViewDelegate,
                                                                 BrandPageViewDataSource,
                                                                 ElectionServiceDelegate,
                                                                 BrandServiceDelegate>

@end
