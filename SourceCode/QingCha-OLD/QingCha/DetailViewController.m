//
//  DetailViewController.m
//  QingCha
//
//  Created by eazytec on 15/12/10.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "DetailViewController.h"

#import "DetailImageTableViewCell.h"
#import "DetailTitleTableViewCell.h"
#import "DetailInterestedTableViewCell.h"
#import "DetailEvaluateTableViewCell.h"

#import "UIDetailEvaluateBtnView.h"

#import "UIConstranits.h"
#import "UIImage+Color.h"

@interface DetailViewController ()

@property (nonatomic,retain) UITableView *detailTableView;
@property (nonatomic,assign) BOOL nativgationShow;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 重新设置navigationItem
    [self.navigationItem setTitle:self.titleOfDetail];
    
    // 自定义后退按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Common_Back"] style:UIBarButtonItemStylePlain target:self action:@selector(doNavigationLeftBarButtonItemAction:)];
    
    NSArray* rightBarButtonItems = [[NSArray alloc]initWithObjects:[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Common_Tool"] style:UIBarButtonItemStylePlain target:self action:nil],[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Common_Interest"] style:UIBarButtonItemStylePlain target:self action:nil], nil];
    
    // 设置扩展功能
    self.navigationItem.rightBarButtonItems = rightBarButtonItems;
   
      // detailTableView作为一个整体
    _detailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -(22 + self.navigationController.navigationBar.frame.size.height), SCREEN_WIDTH, SCREEN_HEIGHT + (22 + self.navigationController.navigationBar.frame.size.height)) style:UITableViewStyleGrouped];
    _detailTableView.delegate    = self;
    _detailTableView.dataSource  = self;
    _detailTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    _detailTableView.sectionHeaderHeight = 0;
    _detailTableView.sectionFooterHeight = 0;
    
    [self.view addSubview:_detailTableView];
    
    // 添加鉴赏按钮
    UIDetailEvaluateBtnView *evaluate = [[UIDetailEvaluateBtnView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 45, SCREEN_HEIGHT, 45)];
    evaluate.delegate = self;
    [self.view addSubview:evaluate];
    
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
    
    _nativgationShow = NO;
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 2;
    }
    else if(section == 1) {
        return 1;
    }
    else if (section == 2){
        return 5;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            DetailImageTableViewCell *cell = [[DetailImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailImageTableViewCell"];
            return cell;
        }else if(indexPath.row == 1) {
            DetailTitleTableViewCell *cell = [[DetailTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailTitleTableViewCell"];
            return cell;
        }
    }
    else if(indexPath.section == 1) {
        DetailInterestedTableViewCell *cell = [[DetailInterestedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailInterestedTableViewCell"];
        return cell;
    }
    else if(indexPath.section == 2){
        DetailEvaluateTableViewCell *cell = [[DetailEvaluateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailEvaluateTableViewCell"];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return SCREEN_WIDTH * 4/5;
        }else if(indexPath.row == 1) {
            NSString *detailText = @"紫砂陶土的成因，属内陆湖泊及滨海湖沼相沉积矿床，通过外力沉积成矿，深埋于山腹之中。紫泥和绿泥都产于甲泥矿中。甲泥是一种脊性粘土，紫红色，色似铁甲，甲泥矿中甲泥储量最多，紫泥，绿泥储量较少，紫泥仅占总储量的3-4%。";
            NSDictionary *detailTextSizeAttirbute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
            CGSize detailTextSize = [detailText boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 30, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin attributes:detailTextSizeAttirbute context:nil].size;
            CGFloat detailTextSizeHeight = detailTextSize.height;
            return 20 + 18 + 10 + 18 + 10 + detailTextSizeHeight + 30 + 12 + 10;
        }
    }
    else if(indexPath.section == 1) {
       return 10 + 14 + 10 + 45 + 10;
    }
    else if (indexPath.section == 2){
        return 100;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.0001;
    }
    else if(section == 1){
        return 10;
    }
    else if (section == 2) {
        return 0.0001;
    }
    return 0;
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


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
   
    CGFloat yIndex = scrollView.contentOffset.y;
    
    if (yIndex >= SCREEN_WIDTH * 4/5 - (2 * (22 + self.navigationController.navigationBar.frame.size.height))) {
        
        if (_nativgationShow == NO) {
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
            _nativgationShow = YES;
        }
        
    }else {
        
        if (_nativgationShow == YES) {
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
            _nativgationShow = NO;
        }
    }
}

#pragma mark - UIDetailEvaluateBtn setting

- (void)pushToEvaluate {
    
    [self performSegueWithIdentifier:@"DetailToEvaluateSegue" sender:self];
}


@end
