//
//  UICommonViewController.m
//  QingCha
//
//  Created by eazytec on 16/1/11.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "UICommonViewController.h"

@interface UICommonViewController ()

@end

@implementation UICommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isNavBarShow = YES;
    self.isCommonBackItems = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!self.isNavBarShow) {
        [self.navigationController setNavigationBarHidden:true];   // 隐藏状态栏
    }else {
        [self.navigationItem setTitle:self.titleOfNav];
        // 确认设置通用的backItem
        if (self.isCommonBackItems) {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Common_Back"]
                                                                                    style:UIBarButtonItemStylePlain
                                                                                    target:self
                                                                                    action:@selector(doNavigationLeftBarButtonItemAction:)];
        }
    }
   
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:false];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UITableView *)tableview {
    if(_tableview == nil) {
        _tableview = [UITableView tableView];
    }
    return _tableview;
}

- (UITableView *)grouptableview {
    if(_tableview == nil) {
        _tableview = [UITableView groupTableView];
    }
    return _tableview;
}

// 返回上一页
- (void)doNavigationLeftBarButtonItemAction:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
