//
//  ArtifactListViewController.m
//  QingCha
//
//  Created by eazytec on 16/2/1.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "ArtifactListViewController.h"

#import "ArtifactHeadViewCell.h"
#import "ArtifactListViewCell.h"

#define COLLECTION_COLS_NUM 2

@interface ArtifactListViewController ()

@property (nonatomic,retain) PSCollectionView *collectionView;
@property (nonatomic,retain) NSArray *artifacts;

@end

@implementation ArtifactListViewController

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

#pragma mark - 相关属性

- (PSCollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[PSCollectionView alloc]initWithFrame:self.view.bounds];
        _collectionView.collectionViewDelegate = self;
        _collectionView.collectionViewDataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_Brand_Scroll_Bg.jpg"]];
        _collectionView.autoresizingMask = UIViewAutoresizingNone;
        _collectionView.numColsPortrait = COLLECTION_COLS_NUM;
    }
    return _collectionView;
}


#pragma mark - init View And Data

- (void)initView {
    self.titleOfNav = self.brandName; //设置标题名称
    
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
}


#pragma mark - Datas

- (void)initData {
    
}


#pragma mark - PSCollectionView Delegate

- (Class)collectionView:(PSCollectionView *)collectionView cellClassForRowAtIndex:(NSInteger)index {
    return index == 0 ? [ArtifactHeadViewCell class]:[ArtifactListViewCell class];
}

- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView {
    return 6 + 1;
}

- (UIView *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index {
    
    // ------------------------ HEAD CELL -------------------------------
    if (index == 0) {
        ArtifactHeadViewCell *cell = [[ArtifactHeadViewCell alloc]initWithFrame:CGRectZero];
        cell.imageView.image = [UIImage imageNamed:@"brand_logo.jpg"];
        return cell;
    }
    // ------------------------ HEAD CELL -------------------------------
    
    ArtifactListViewCell *cell = (ArtifactListViewCell *)[self.collectionView dequeueReusableViewForClass:[ArtifactListViewCell class]];
    if(cell == nil) {
        cell = [[ArtifactListViewCell alloc] initWithFrame:CGRectZero];
    }

    cell.imageView.image = [UIImage imageNamed:@"image2.jpg"];
    cell.titleLabel.text = @"夏至未至";
    cell.introductionLabel.text = @"唐代张籍有诗曰:仙果人间都未有,今朝忽见天下门。唐代张籍有诗曰:仙果人间都未有,今朝忽见天下门。唐代张籍有诗曰:仙果人间都未有,今朝忽见天下门。唐代张籍有诗曰:仙果人间都未有,今朝忽见天下门。";
    return cell;
}

- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index {
    return index == 0 ? [ArtifactHeadViewCell height]:[ArtifactListViewCell height];
}


@end
