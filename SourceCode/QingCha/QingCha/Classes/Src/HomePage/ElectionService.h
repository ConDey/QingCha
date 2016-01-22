//
//  ElectionService.h
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ElectionMessage.h"

//  推荐作品服务模型

@class ElectionService;

@protocol ElectionServiceDelegate <NSObject>

- (void)electionsLoadingFinish:(ElectionMessage *)message;   //  请求结束之后的数据处理

@end

@interface ElectionService : QCService

@property (nonatomic,weak) id<ElectionServiceDelegate> delegate;

// 分页加载推荐作品
- (void)loadingElectionsByPageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize;

@end
