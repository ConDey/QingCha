//
//  ArtifactListViewController.m
//  QingCha
//
//  Created by eazytec on 16/2/1.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "ArtifactListViewController.h"

#import "ArtifactListHeadViewCell.h"
#import "ArtifactListViewCell.h"

#define COLLECTION_COLS_NUM 2

@interface ArtifactListViewController ()

@property (nonatomic,retain) PSCollectionView *collectionView;
@property (nonatomic,retain) NSMutableArray *artifacts;

@property (nonatomic,retain) ArtifactService *artifactService;

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

- (NSMutableArray *)artifacts {
    if (_artifacts == nil) {
        _artifacts = [[NSMutableArray alloc]init];
    }
    return _artifacts;
}

- (ArtifactService *)artifactService {
    if (_artifactService == nil) {
        _artifactService = [[ArtifactService alloc]init];
        _artifactService.delegate = self;
    }
    return _artifactService;
}


#pragma mark - init View And Data

- (void)initView {
    self.titleOfNav = self.brandName; //设置标题名称
    self.pageSize = self.view.bounds.size.height / [ArtifactListViewCell height] + 1;
    
    [self.view addSubview:self.collectionView];
}


#pragma mark - Datas

- (void)initData {
    [self.artifactService loadingArtifactsByPageIndex:1 pageSize:self.pageSize];
}


#pragma mark - PSCollectionView Delegate

- (Class)collectionView:(PSCollectionView *)collectionView cellClassForRowAtIndex:(NSInteger)index {
    return index == 0 ? [ArtifactListHeadViewCell class]:[ArtifactListViewCell class];
}

- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView {
    return [NSArray isArrayNull:self.artifacts] ? 0:[self.artifacts count] + 1;
}

- (UIView *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index {
    
    // ------------------------ HEAD CELL -------------------------------
    if (index == 0) {
        ArtifactListHeadViewCell *cell = [[ArtifactListHeadViewCell alloc]initWithFrame:CGRectZero];
        cell.imageView.image = [UIImage imageNamed:@"brand_logo.jpg"];
        return cell;
    }
    // ------------------------ HEAD CELL -------------------------------
    
    ArtifactListViewCell *cell = (ArtifactListViewCell *)[self.collectionView dequeueReusableViewForClass:[ArtifactListViewCell class]];
    if(cell == nil) {
        cell = [[ArtifactListViewCell alloc] initWithFrame:CGRectZero];
    }

    cell.imageView.image = [UIImage imageNamed:@"image2.jpg"];
    
    QCArtifact *artifact = [self.artifacts objectAtIndex:index-1]; // 这里-1是因为有headViewCell
    
    cell.titleLabel.text = artifact.title;
    cell.introductionLabel.text = artifact.introduction;
    return cell;
}

- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index {
    return index == 0 ? [ArtifactListHeadViewCell height]:[ArtifactListViewCell height];
}

#pragma mark ArtifactServiceDelegate

- (void)artifactsLoadingFinish:(ArtifactMessage *)message {
    if ([message isSuccess]) {
        // 设置分页数据
        self.currentPage = message.currentPage;
        self.totalCount = message.totalCount;
        self.totalPage  = message.totalPage;
        // 设置作品列表数据
        [self.artifacts addObjectsFromArray:message.artifacts];
        [self.collectionView reloadData];
    }
}


@end
