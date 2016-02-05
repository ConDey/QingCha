 //
//  ArtifactViewController.m
//  QingCha
//
//  Created by eazytec on 16/2/4.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "ArtifactViewController.h"

#define TABLE_VIEW_INDEX_X 0
#define TABLE_VIEW_INDEX_Y -(STATUS_BAR_HEIGHT + self.navigationController.navigationBar.frame.size.height)
#define TABLE_VIEW_WIDTH   SCREEN_WIDTH
#define TABLE_VIEW_HEIGHT  SCREEN_HEIGHT + STATUS_BAR_HEIGHT + self.navigationController.navigationBar.frame.size.height

@interface ArtifactViewController ()

@property (nonatomic,retain) UIBarButtonItem *interestedItem;  //收藏/关注ButtonItem
@property (nonatomic,retain) UIBarButtonItem *sharedItem;      //分享ButtonItem

@end

@implementation ArtifactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];    // 初始化View
    [self initData];    // 初始化数据
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init View And Data

- (void)initView {
    
    // 自定义扩展功能菜单
    self.navigationItem.rightBarButtonItems = [[NSArray alloc]initWithObjects:self.sharedItem, self.interestedItem, nil];
    
    // 加入grouptableview
    self.grouptableview.frame = CGRectMake(TABLE_VIEW_INDEX_X, TABLE_VIEW_INDEX_Y, TABLE_VIEW_WIDTH, TABLE_VIEW_HEIGHT);
    self.grouptableview.delegate = self;
    self.grouptableview.dataSource = self;
    [self.view addSubview:self.grouptableview];
}

- (void)initData {
    
}

#pragma mark - 属性设置

- (UIBarButtonItem *)interestedItem {
    if (_interestedItem == nil) {
        _interestedItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Common_UnInterested"] style:UIBarButtonItemStylePlain target:self action:nil];
    }
    return _interestedItem;
}

- (UIBarButtonItem *)sharedItem {
    if (_sharedItem == nil) {
        _sharedItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Common_Shared"] style:UIBarButtonItemStylePlain target:self action:nil];
    }
    return _sharedItem;
}

#pragma mark - GroupTableView : delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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
