//
//  HomePageViewController.m
//  QingCha
//
//  Created by eazytec on 16/1/11.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "HomePageViewController.h"

#import "HomePageGuideView.h"
#import "ElectionViewCell.h"

#import "ElectionMessage.h"
#import "BrandMessage.h"

#define HOME_GUIDE_HEIGHT    STATUS_BAR_HEIGHT + 50.0
#define HOME_CONTENT_INDEX_Y HOME_GUIDE_HEIGHT

#define HOME_TABLE_HEIGHT    SCREEN_HEIGHT - STATUS_BAR_HEIGHT - 50.0
#define HOME_BRAND_HEIGHT    HOME_TABLE_HEIGHT

#define HOME_PAGE_SIZE  20

@interface HomePageViewController ()

// Views
@property (nonatomic,retain) HomePageGuideView *guideview;
@property (nonatomic,retain) BrandView         *brandview;

// Datas
@property (nonatomic,retain) NSMutableArray  *elections;
@property (nonatomic,retain) NSMutableArray  *brands;

// Service
@property (nonatomic,retain) ElectionService *electionService;
@property (nonatomic,retain) BrandService    *brandService;

// 跳转中间字段
@property (nonatomic,retain) NSString        *brandID;
@property (nonatomic,retain) NSString        *brandName;

@end

@implementation HomePageViewController

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
    self.pageSize = HOME_PAGE_SIZE;
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"推荐",@"品牌",nil];
    // 这里隐藏了NavigationBar,所以Y轴的距离计算的时候要加上StatusBar的高度
    self.guideview = [[HomePageGuideView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HOME_GUIDE_HEIGHT) segmentedData:segmentedData];
    
    // 绑定SegmentedControl事件
    [self.guideview.segmentedControl addTarget:self action:@selector(segmentedControlPressed:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.guideview];
    
    // 初始化推荐页
    self.tableview.frame = CGRectMake(0, HOME_CONTENT_INDEX_Y, SCREEN_WIDTH, HOME_TABLE_HEIGHT);
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    [self.tableview setHidden:NO]; // 推荐页默认是可见的
    [self.view addSubview:self.tableview];
    
    // 初始化品牌页
    [self.brandview setHidden:YES];
    [self.view addSubview:self.brandview];
    [self.brandview.brandPageView reloadData];
}

- (NSMutableArray *)elections {
    if([NSArray isArrayNull:_elections]) {
        _elections = [[NSMutableArray alloc]init];
    }
    return _elections;
}

- (NSMutableArray *)brands {
    if([NSArray isArrayNull:_brands]) {
        _brands = [[NSMutableArray alloc]init];
    }
    return _brands;
}

- (ElectionService *)electionService {
    if(_electionService == nil) {
        _electionService = [[ElectionService alloc]init];
        _electionService.delegate = self;
    }
    return _electionService;
}

- (BrandService *)brandService {
    if(_brandService == nil) {
        _brandService = [[BrandService alloc]init];
        _brandService.delegate = self;
    }
    return _brandService;
}

- (BrandView *)brandview {
    if(_brandview == nil) {
        _brandview = [[BrandView alloc]initWithFrame:CGRectMake(0, HOME_CONTENT_INDEX_Y, SCREEN_WIDTH, HOME_BRAND_HEIGHT)];
        _brandview.brandPageView.delegate = self;
        _brandview.brandPageView.dataSource = self;
    }
    return _brandview;
}


#pragma mark - datas

- (void)initData {
    [self.electionService loadingElectionsByPageIndex:1 pageSize:self.pageSize];
    [self.brandService loadingTopBrandList];
}

- (void)electionsLoadingFinish:(ElectionMessage *)message {
    if ([message isSuccess]) {
        // 设置分页数据
        self.currentPage = message.currentPage;
        self.totalCount = message.totalCount;
        self.totalPage  = message.totalPage;
        // 设置推荐作品数据
        [self.elections addObjectsFromArray:message.elections];
        [self.tableview reloadData];
    }
    
}

- (void)topBrandsLoadingFinish:(BrandMessage *)message {
    if ([message isSuccess]) {
        // 设置推荐作品数据
        [self.brands addObjectsFromArray:message.brands];
        [self.brandview.brandPageView reloadData];
    }
}

#pragma mark - HomePageGuideView : SegmentedControl 事件

- (void)segmentedControlPressed:(UISegmentedControl *)control {
    NSInteger index = control.selectedSegmentIndex;
    switch (index) {
        case 0: // 点击推荐页
            [self.tableview setHidden:NO];
            [self.brandview setHidden:YES];
            break;
        case 1: // 点击品牌页
            [self.tableview setHidden:YES];
            [self.brandview setHidden:NO];
            break;
        default:
            break;
    }
}

#pragma mark - HomePageElectedView : delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.elections count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ElectionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ElectionViewCell"];
    
    if (cell == nil) {
        cell = [[ElectionViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ElectionViewCell"];
    }
    [cell importDataForElection:[self.elections objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ElectionViewCell height];
}

#pragma mark - BrandPageView :delegate

- (NSInteger)numberOfPageInPageScrollView:(BrandPageView *)brandPageView {
    return [self.brands count];
}

- (BrandPageViewCell *)pageScrollView:(BrandPageView *)brandPageView viewForRowAtIndex:(NSInteger)index {
    
    BrandPageViewCell *cell = [[BrandPageViewCell alloc]init];
    QCBrand *brand = [self.brands objectAtIndex:index];
    
    if (brand != nil) {
        cell.imageview.image = [UIImage imageNamed:@"image2.jpg"];
        cell.titlelabel.text = brand.name;
        cell.introductionlabel.text = brand.introduction;
    }
    return cell;
}

- (void)pageScrollView:(BrandPageView *)brandPageView didTapPageAtIndex:(NSInteger)index {
    QCBrand *brand = [self.brands objectAtIndex:index];
    self.brandID = brand.bid;
    self.brandName = brand.name;
    [self performSegueWithIdentifier:@"HomeToArtifactListSegue" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UIViewController* view = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"HomeToArtifactListSegue"]) {
        [view setValue:self.brandName forKey:@"brandName"];
        [view setValue:self.brandID forKey:@"brandID"];
    }
    
}

@end
