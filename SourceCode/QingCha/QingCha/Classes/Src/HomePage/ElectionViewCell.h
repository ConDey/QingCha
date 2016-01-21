//
//  ElectionViewCell.h
//  QingCha
//
//  Created by eazytec on 16/1/19.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <UIKit/UIKit.h>

// 推荐页uitableviewcell

@interface ElectionViewCell : UITableViewCell

+ (CGFloat)height; // 获得Cell的高度

- (void)importDataForElection:(QCElection *)election; // 导入展示数据

@end
