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

// 作品品牌
@property (nonatomic,retain) QCBrand *brand;

// 作者
@property (nonatomic,retain) NSString *author;

// 出处
@property (nonatomic,retain) NSString *source;

// 查看数量
@property (nonatomic,retain) NSString *visitnum;

@end
