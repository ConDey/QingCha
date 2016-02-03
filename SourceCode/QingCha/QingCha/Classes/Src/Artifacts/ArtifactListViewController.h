//
//  ArtifactListViewController.h
//  QingCha
//
//  Created by eazytec on 16/2/1.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "UIRefreshTableViewController.h"
#import "PSCollectionView.h"


// 品牌页下的作品列表

@interface ArtifactListViewController : UIRefreshTableViewController<PSCollectionViewDelegate,PSCollectionViewDataSource>

@property (nonatomic,retain) NSString *brandID;    // 品牌ID
@property (nonatomic,retain) NSString *brandName;  // 品牌名称

@end
