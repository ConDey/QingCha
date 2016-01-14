//
//  ViewController.m
//  QingCha
//
//  Created by eazytec on 15/12/2.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "MainViewController.h"
#import "ProductsViewController.h"

#import "ElectedTableView.h"
#import "ElectedTableViewCell.h"

#import "UIBrandView.h"
#import "UIBrandScrollView.h"

#import "UIConstranits.h"

@interface MainViewController ()

@property (nonatomic,retain) ElectedTableView *electedTableView;
@property (nonatomic,retain) UIBrandScrollView *brandView;

@property (nonatomic,retain) UIImageView *logoImageView;
@property (nonatomic,retain) UITapGestureRecognizer *logoImageViewRecognizer;

@property (nonatomic,retain) NSString * NoOfProducts; // 临时变量: 产品标题NO

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Main_Logo"]];
    _logoImageView.frame = CGRectMake(20, 30.0, 30.0, 30.0);
    _logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    _logoImageView.userInteractionEnabled = YES;
    
    _logoImageViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapOpenMenu:)];
    [_logoImageView addGestureRecognizer:_logoImageViewRecognizer];
    [_logoImageViewRecognizer setNumberOfTapsRequired:1];    // 1次点击
    [_logoImageViewRecognizer setNumberOfTouchesRequired:1]; // 1个手指操作

    
    [self.view addSubview:_logoImageView];
    
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"推荐",@"品牌",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    
    CGFloat segmentx = (SCREEN_WIDTH - 150) / 2;
    segmentedControl.frame = CGRectMake(segmentx, 30.0, 150.0, 30.0);
    segmentedControl.layer.cornerRadius  = 15.0;
    segmentedControl.layer.borderWidth   = 1.0f;
    segmentedControl.layer.masksToBounds = YES;
    
    // 这个是设置按下按钮时的颜色
    segmentedControl.tintColor = [UIColor colorWithRed:7.0 / 255.0 green:21.0 / 255.0 blue:21.0 / 255.0 alpha:1];
    segmentedControl.selectedSegmentIndex = 0;//默认选中的按钮索引
    
    // 下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName,[UIColor colorWithRed:7.0 / 255.0 green:21.0 / 255.0 blue:21.0 / 255.0 alpha:1], NSForegroundColorAttributeName, nil];
    [segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [segmentedControl addTarget:self action:@selector(segmentedControlPressed:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
    // 推荐页的scrollview
    _electedTableView = [[ElectedTableView alloc]initWithFrame:CGRectMake(0, 70.0, SCREEN_WIDTH, SCREEN_HEIGHT - 70) style:UITableViewStylePlain];
    _electedTableView.delegate    = self;
    _electedTableView.dataSource  = self;
    [self.view addSubview:_electedTableView];
    
    // 品牌页的scrollview
    _brandView = [[UIBrandScrollView alloc]initWithFrame:CGRectMake(0, 70.0, SCREEN_WIDTH, SCREEN_HEIGHT - 70) andTarget:self];
    //_brandView.delegate = self;
    [_brandView setHidden:true];
    [self.view addSubview:_brandView];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true];   // 隐藏状态栏
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:false];
}


#pragma mark - Table view data source

-(void)segmentedControlPressed:(UISegmentedControl *)control {
    NSInteger index = control.selectedSegmentIndex;
    switch (index) {
        case 0:
            // 点击推荐页
            [_electedTableView setHidden:false];
            [_brandView setHidden:true];
            break;
        case 1:
            // 点击品牌页
            [_electedTableView setHidden:true];
            [_brandView setHidden:false];
            break;
        default:
            break;
    }  
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ElectedTableViewCell *cell = [[ElectedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ElectedTableViewCell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  SCREEN_WIDTH * 2/3 + 30 + 14 + 14.0 + 10 + 12.0 + 18;
}

// 点击跳转事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{;
    [self performSegueWithIdentifier:@"MainToDetailSegue" sender:self];
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


#pragma mark - UIBrand view setting

- (void)pushToProducts:(NSString *)NoOfProducts {
    
    _NoOfProducts = NoOfProducts;
    [self performSegueWithIdentifier:@"MainToProductsSegue" sender:self];
}

// 手势实现
- (void) handleSingleTapOpenMenu:(UITapGestureRecognizer *)recognizer {
    
   [self.drawer open];
}

- (void) pushToSegues: (NSString *)segue {
    [self performSegueWithIdentifier:segue sender:self];
}

#pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UIViewController* view = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"MainToProductsSegue"]) {
        [view setValue:_NoOfProducts forKey:@"titleOfProducts"];
    }
    
    if ([segue.identifier isEqualToString:@"MainToDetailSegue"]) {
        [view setValue:@"有一间茶馆" forKey:@"titleOfDetail"];
    }
    
}

@end
