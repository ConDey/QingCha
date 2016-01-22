//
//  QCMessage.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "QCMessage.h"

@implementation QCMessage

#pragma mark 初始化方法

- (id)initWithCode:(RESULT_CODE)code resultMsg:(NSString *)resultMsg displayMsg:(NSString *)displayMsg {
    
    if (self = [super init]) {
        self.resultCode = code;
        self.displayMsg = displayMsg;
        self.resultMsg  = resultMsg;
    }
    return self;
}

- (id)initDataErrorWithMsg:(NSString *)msg {
    return [self initWithCode:QC_Error_DataError resultMsg:msg displayMsg:MSG_COMMON_ERROR];
}

- (id)initNetWorkingErrorWithMsg:(NSString *)msg {
    return [self initWithCode:QC_Error_NetworkingError resultMsg:msg displayMsg:MSG_NETWORKING_ERROR];
}

- (id)initWithHttpMessage:(HttpMessage *)httpMessage {
    if ([QCMessage isSuccess:httpMessage.resultCode]) {
        return [self initWithCode:httpMessage.resultCode resultMsg:httpMessage.resultMsg displayMsg:httpMessage.resultMsg];
    }else {
        return [self initWithCode:httpMessage.resultCode resultMsg:httpMessage.resultMsg displayMsg:MSG_COMMON_ERROR];
    }
}

#pragma mark 相关工具方法

+ (BOOL)isSuccess:(RESULT_CODE)resultCode {
    if (resultCode == QC_Success) {
        return YES;
    }
    return NO;
}

- (BOOL)isSuccess {
    if (self.resultCode == QC_Success) {
        return YES;
    }
    return NO;
}

- (void)parseTablePaging:(HttpMessage *)httpMessage {
    
    NSDictionary *content = httpMessage.content;
    
    self.currentPage = [NSNumber integerValue:[content objectForKey:HTTP_CURRENT_PAGE]];
    self.totalCount  = [NSNumber integerValue:[content objectForKey:HTTP_TOTAL_COUNT]];
    self.totalPage   = [NSNumber integerValue:[content objectForKey:HTTP_TOTAL_PAGE]];
}

- (BOOL)isFirstPage {
    return self.currentPage == 1 ? YES : NO;
}

- (BOOL)isLastPage {
    return self.currentPage == self.totalPage ? YES : NO;
}

@end
