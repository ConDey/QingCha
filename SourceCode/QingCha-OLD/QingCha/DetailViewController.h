//
//  DetailViewController.h
//  QingCha
//
//  Created by eazytec on 15/12/10.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIDetailEvaluateBtnView.h"

@interface DetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate,UIDetailEvaluateBtnViewDelegate>

@property (nonatomic,retain) NSString *titleOfDetail;  // 产品列表标题

@end
