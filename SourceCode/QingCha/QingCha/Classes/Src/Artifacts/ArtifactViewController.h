//
//  ArtifactViewController.h
//  QingCha
//
//  Created by eazytec on 16/2/4.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "UIRefreshTableViewController.h"

// 作品详情页

@interface ArtifactViewController : UIRefreshTableViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) NSString *artifactID;  // 作品ID号

@end
