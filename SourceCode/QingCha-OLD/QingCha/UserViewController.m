//
//  UserViewController.m
//  QingCha
//
//  Created by eazytec on 15/12/22.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "UserViewController.h"

#import "UIImage+Color.h"
#import "UIConstranits.h"

#import "UserHeadTableViewCell.h"
#import "UserTitleTableViewCell.h"
#import "UserHistoryTableViewCell.h"


@interface UserViewController ()

@property (nonatomic,retain) UITableView *detailTableView;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 重新设置navigationItem
    [self.navigationItem setTitle:@""];
    
    // 自定义后退按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Common_Back"] style:UIBarButtonItemStylePlain target:self action:@selector(doNavigationLeftBarButtonItemAction:)];
    
    // detailTableView作为一个整体
    _detailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -(22 + self.navigationController.navigationBar.frame.size.height), SCREEN_WIDTH, SCREEN_HEIGHT + (22 + self.navigationController.navigationBar.frame.size.height)) style:UITableViewStyleGrouped];
    _detailTableView.delegate    = self;
    _detailTableView.dataSource  = self;
    _detailTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    _detailTableView.sectionHeaderHeight = 0;
    _detailTableView.sectionFooterHeight = 0;
    
    [self.view addSubview:_detailTableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsCompactPrompt];
    
    // 去掉navigationBar下面的横线
    NSArray *list = self.navigationController.navigationBar.subviews;
    for (id obj in list) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView = (UIImageView *)obj;
            NSArray *list2 = imageView.subviews;
            for (id obj2 in list2) {
                if ([obj2 isKindOfClass:[UIImageView class]]) {
                    UIImageView *imageView2 = (UIImageView *)obj2;
                    imageView2.hidden = YES;
                }}}}
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsCompactPrompt];
    NSArray *list = self.navigationController.navigationBar.subviews;
    for (id obj in list) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView = (UIImageView *)obj;
            NSArray *list2 = imageView.subviews;
            for (id obj2 in list2) {
                if ([obj2 isKindOfClass:[UIImageView class]]) {
                    UIImageView *imageView2 = (UIImageView *)obj2;
                    imageView2.hidden = NO;
                }}}}
}

// 返回上一页
- (void)doNavigationLeftBarButtonItemAction:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    else if(section == 1) {
        return 1;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UserHeadTableViewCell *cell = [[UserHeadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserHeadTableViewCell"];
            return cell;
        }
        else if (indexPath.row == 1) {
            UserTitleTableViewCell *cell = [[UserTitleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserTitleTableViewCell"];
            return cell;
        }
    }else if (indexPath.section == 1) {
        UserHistoryTableViewCell *cell = [[UserHistoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserHistoryTableViewCell"];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return SCREEN_WIDTH * 3/5;
        }else {
            return 100;
        }
    }
    else if (indexPath.section == 1) {
        return 10 + 14 + 10 + 45 + 10;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.0001;
    }
    else if (section == 1){
        return 10;
    }
    return 0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
