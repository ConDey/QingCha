//
//  ElectedViewCell.h
//  QingCha
//
//  Created by eazytec on 16/1/19.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <UIKit/UIKit.h>

// 推荐页uitableviewcell

@interface ElectedViewCell : UITableViewCell

@property (nonatomic,retain) UIImageView *electionImageView;
@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) UILabel *introductionLabel;

@property (nonatomic,retain) UILabel *numLabel;

@end
