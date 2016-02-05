//
//  BrandService.h
//  QingCha
//
//  Created by eazytec on 16/2/1.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "BrandMessage.h"

//  作品品牌服务模型

@class BrandService;

@protocol BrandServiceDelegate <NSObject>

- (void)topBrandsLoadingFinish:(BrandMessage *)message;   //  请求结束之后的数据处理

@end

@interface BrandService : QCService

@property (nonatomic,weak) id<BrandServiceDelegate> delegate;

// 加载首页推荐作品集合
- (void)loadingTopBrandList;

@end
