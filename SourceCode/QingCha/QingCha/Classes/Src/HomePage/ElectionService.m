//
//  ElectionService.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "ElectionService.h"

@implementation ElectionService

- (void)loadingElectionsByPageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    HttpMessage *httpmessage = [[HttpMessage alloc]initWithDelegate:self
                                                        postDataDic:params
                                                        serivceCode:QC_Election_PageLoading];
    [self.httpMsgCtrl request:httpmessage];
}

#pragma mark HttpResponseDelegate代理方法

- (void)receiveDidFinished:(HttpMessage *)receiveMsg {
    [super receiveDidFinished:receiveMsg];
    
    if (receiveMsg.serviceCode == QC_Election_PageLoading) {
        [self.delegate electionsLoadingFinish:[[ElectionMessage alloc]initWithHttpMessage:receiveMsg]];
    }
}

- (void)receiveDidFailed:(HttpMessage *)receiveMsg {
    [super receiveDidFailed:receiveMsg];
    
    if (receiveMsg.serviceCode == QC_Election_PageLoading) {
        [self.delegate electionsLoadingFinish:[[ElectionMessage alloc]initNetWorkingErrorWithMsg:receiveMsg.resultMsg]];
    }
}

@end
