//
//  QCMessage.h
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//


#import <Foundation/Foundation.h>

// 标准的数据回执模型

@interface QCMessage : NSObject

@property (nonatomic,assign) RESULT_CODE resultCode;

@property (nonatomic,retain) NSString *resultMsg;

// 当前分页
@property (nonatomic,assign) NSInteger currentPage;

// 每页显示的数量
@property (nonatomic,assign) NSInteger pageSize;

// 数据总量
@property (nonatomic,assign) NSInteger totalCount;

// 页数总量
@property (nonatomic,assign) NSInteger totalPage;

@end
