//
//  Artifact.h
//  QingCha
//
//  Created by eazytec on 16/1/19.
//  Copyright © 2016年 QingCha. All rights reserved.
//

// QC作品详情

@interface QCArtifact : QCModel

// 商品标题
@property (nonatomic,retain) NSString *title;

// 商品简介
@property (nonatomic,retain) NSString *introduction;

// 商品标签集合
@property (nonatomic,retain) NSArray *tags;

// 推荐图
@property (nonatomic,retain) UIImage *electionImage;


@end
