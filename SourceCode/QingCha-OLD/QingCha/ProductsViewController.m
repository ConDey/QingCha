//
//  ProductsViewController.m
//  QingCha
//
//  Created by eazytec on 15/12/4.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "ProductsViewController.h"

#import "ProductsHeadViewCell.h"
#import "ProductViewCell.h"

#import "UIConstranits.h"


@interface ProductsViewController ()

@property (nonatomic,retain) UICollectionView *collectionView;

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 重新设置navigationItem
    [self.navigationItem setTitle:self.titleOfProducts];
    
    // 自定义后退按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Common_Back"] style:UIBarButtonItemStylePlain target:self action:@selector(doNavigationLeftBarButtonItemAction:)];
    
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 0, 5);
    layout.columnCount = 2;
    layout.minimumColumnSpacing    = 5;  // cell之间的水平间距
    layout.minimumInteritemSpacing = 5;  // cell之间的垂直间距
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.collectionViewLayout = layout;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    UIImage *image_black = [UIImage imageNamed:@"Brand_Bg"];
    UIColor *color_pattern = [[UIColor alloc] initWithPatternImage:image_black];
    _collectionView.backgroundColor = color_pattern;
    
    [_collectionView registerClass:[ProductsHeadViewCell class] forCellWithReuseIdentifier:@"HeadViewCell"];
    [_collectionView registerClass:[ProductViewCell class] forCellWithReuseIdentifier:@"ViewCell"];
    [self.view addSubview:_collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 返回上一页
- (void)doNavigationLeftBarButtonItemAction:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UICollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == 0) {
        ProductsHeadViewCell *cell = (ProductsHeadViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HeadViewCell"
                                                                               forIndexPath:indexPath];
        return cell;
    }
    else {
        ProductViewCell *cell = (ProductViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ViewCell"
                                                                                                       forIndexPath:indexPath];
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
       [self performSegueWithIdentifier:@"ProductsToDetailSegue" sender:self];
    }
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
       return CGSizeMake((SCREEN_WIDTH - 5 * 3)/2, (SCREEN_WIDTH - 5 * 3)/2 * 2 / 3);
    }
    else {
       return CGSizeMake((SCREEN_WIDTH - 5 * 3)/2, (SCREEN_WIDTH - 5 * 3)/2 * 5 / 3);
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UIViewController* view = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"ProductsToDetailSegue"]) {
        [view setValue:@"有一间茶馆" forKey:@"titleOfDetail"];
    }
}

@end
