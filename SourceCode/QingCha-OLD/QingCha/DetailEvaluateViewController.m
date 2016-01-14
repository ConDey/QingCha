//
//  DetailEvaluateViewController.m
//  QingCha
//
//  Created by eazytec on 15/12/17.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "DetailEvaluateViewController.h"

#import "UIConstranits.h"

#import "EvaluateTextTableViewCell.h"
#import "EvaluateScoreTableViewCell.h"

@interface DetailEvaluateViewController ()

@end

@implementation DetailEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 重新设置navigationItem
    [self.navigationItem setTitle:@"鉴赏"];
    
    // 自定义后退按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Common_Back"] style:UIBarButtonItemStylePlain target:self action:@selector(doNavigationLeftBarButtonItemAction:)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Common_Sure"] style:UIBarButtonItemStylePlain target:self action:@selector(doNavigationLeftBarButtonItemAction:)];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    UITableView *tableview  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    tableview.delegate    = self;
    tableview.dataSource  = self;
    tableview.separatorStyle = UITableViewCellSelectionStyleNone;
    
    tableview.sectionHeaderHeight = 0;
    tableview.sectionFooterHeight = 0;
    
    [self.view addSubview:tableview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 返回上一页
- (void)doNavigationLeftBarButtonItemAction:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        EvaluateTextTableViewCell *cell = [[EvaluateTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EvaluateTextTableViewCell"];
        return cell;
    }else if (indexPath.row == 1) {
        EvaluateScoreTableViewCell *cell = [[EvaluateScoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EvaluateScoreTableViewCell"];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 160;
    }else if (indexPath.row == 1) {
        return 50;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

#pragma mark - Table view setting

// 自定义TableViewCell分割线, 清除前面15PX的空白
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
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
