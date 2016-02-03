//
//  ArtifactService.h
//  QingCha
//
//  Created by eazytec on 16/2/3.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "QCService.h"
#import "ArtifactMessage.h"

// 产品服务模型

@class ArtifactService;

@protocol ArtifactServiceDelegate <NSObject>

- (void)artifactsLoadingFinish:(ArtifactMessage *)message;   //  请求结束之后的数据处理

@end

@interface ArtifactService : QCService

@property (nonatomic,weak) id<ArtifactServiceDelegate> delegate;

- (void)loadingArtifactsByPageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize;

@end
