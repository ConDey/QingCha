//
//  QCElection.h
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "QCArtifact.h"

// 推荐作品模型

@interface QCElection : QCArtifact

// eid
@property (nonatomic,retain) NSString *eid;

// 推荐图
@property (nonatomic,retain) UIImage *electionImage;

- (NSArray *)tagsDisplay; // 加载显示标签

@end
