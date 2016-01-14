//
//  ProductsViewController.h
//  QingCha
//
//  Created by eazytec on 15/12/4.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CHTCollectionViewWaterfallLayout.h>

@interface ProductsViewController : UIViewController <CHTCollectionViewDelegateWaterfallLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,retain) NSString *titleOfProducts;  // 产品列表标题

@end
