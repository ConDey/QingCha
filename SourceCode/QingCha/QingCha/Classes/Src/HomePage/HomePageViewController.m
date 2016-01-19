//
//  HomePageViewController.m
//  QingCha
//
//  Created by eazytec on 16/1/11.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "HomePageViewController.h"

#import "HomePageGuideView.h"
#import "ElectedViewCell.h"

#define HOME_GUIDE_HEIGHT  STATUS_BAR_HEIGHT + 50.0

#define HOME_CONTENT_INDEX_Y HOME_GUIDE_HEIGHT

@interface HomePageViewController ()

// Views
@property (nonatomic,retain) HomePageGuideView *guideView;

// ElectedTableDataSource
@property (nonatomic,retain) NSArray *elections;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView]; // 初始化View
    // [self initData]; // 初始化数据
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

#pragma mark - init View And Data

- (void)initView {
    
    /**
     *   整体View布局规则:
     *   ----------------------------------------------
     *               |70:guideView|
     *   ----------------------------------------------
     *               |SCREEN_HEIGHT - 70:tableView |
     *               |SCREEN_HEIGHT - 70:scrollView|
     *   ----------------------------------------------
     */
    self.isNavBarShow = NO;  // 隐藏NavBar
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"推荐",@"品牌",nil];
    // 这里隐藏了NavigationBar,所以Y轴的距离计算的时候要加上StatusBar的高度
    self.guideView = [[HomePageGuideView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HOME_GUIDE_HEIGHT) andSegmentedData:segmentedData];
    
    // 绑定SegmentedControl事件
    [self.guideView.segmentedControl addTarget:self action:@selector(segmentedControlPressed:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.guideView];
    
    // 初始化推荐页
    self.tableview = [UITableView tableView];
    self.tableview.frame = CGRectMake(0, HOME_CONTENT_INDEX_Y, SCREEN_WIDTH, SCREEN_HEIGHT - HOME_CONTENT_INDEX_Y);
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    [self.tableview setHidden:NO]; // 推荐页默认是可见的
    [self.view addSubview:self.tableview];
}

- (NSArray *)elections{
    if([NSArray isArrayNull:_elections]){
        _elections = [[NSArray alloc]init];
    }
    return _elections;
}

#pragma mark - HomePageGuideView : SegmentedControl 事件

- (void)segmentedControlPressed:(UISegmentedControl *)control {
    NSInteger index = control.selectedSegmentIndex;
    switch (index) {
        case 0: // 点击推荐页
            [self.tableview setHidden:NO];
            break;
        case 1: // 点击品牌页
            [self.tableview setHidden:YES];
            break;
        default:
            break;
    }
}

#pragma mark - HomePageElectedView : delegate

#pragma mark - HomePageElectedView : datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.elections count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

@end
