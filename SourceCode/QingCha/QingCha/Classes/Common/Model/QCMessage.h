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

// 返回结果码
@property (nonatomic,assign) RESULT_CODE resultCode;

// 返回结果
@property (nonatomic,retain) NSString *resultMsg;

// 显示结果
@property (nonatomic,retain) NSString *displayMsg;

// 当前分页
@property (nonatomic,assign) NSInteger currentPage;

// 数据总量
@property (nonatomic,assign) NSInteger totalCount;

// 页数总量
@property (nonatomic,assign) NSInteger totalPage;


// 相关初始化方法
- (id)initWithCode:(RESULT_CODE)code resultMsg:(NSString *)resultMsg displayMsg:(NSString *)displayMsg;
- (id)initDataErrorWithMsg:(NSString *)msg;  // 数据出错
- (id)initNetWorkingErrorWithMsg:(NSString *)msg;  // 网络出错
- (id)initWithHttpMessage:(HttpMessage *)httpMessage;  // 根据HttpMessage 初始化

// 相关工具方法
+ (BOOL)isSuccess:(RESULT_CODE)resultCode;
- (BOOL)isSuccess;
- (void)parseTablePaging:(HttpMessage *)httpMessage;
- (BOOL)isFirstPage;
- (BOOL)isLastPage;

@end
