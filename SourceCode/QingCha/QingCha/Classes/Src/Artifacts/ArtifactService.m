//
//  ArtifactService.m
//  QingCha
//
//  Created by eazytec on 16/2/3.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "ArtifactService.h"

@implementation ArtifactService

- (void)loadingArtifactsByPageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize {
    
    NSMutableDictionary *params = [self createPagingParamsByPageIndex:pageIndex pageSize:pageSize];
    HttpMessage *httpmessage = [[HttpMessage alloc]initWithDelegate:self
                                                        postDataDic:params
                                                        serivceCode:QC_Artifacts_Loading];
    [self.httpMsgCtrl request:httpmessage];
}

#pragma mark HttpResponseDelegate代理方法

- (void)receiveDidFinished:(HttpMessage *)receiveMsg {
    [super receiveDidFinished:receiveMsg];
    
    if (receiveMsg.serviceCode == QC_Artifacts_Loading) {
        [self.delegate artifactsLoadingFinish:[[ArtifactMessage alloc]initWithHttpMessage:receiveMsg]];
    }
}

- (void)receiveDidFailed:(HttpMessage *)receiveMsg {
    [super receiveDidFailed:receiveMsg];
    
    if (receiveMsg.serviceCode == QC_Artifacts_Loading) {
        [self.delegate artifactsLoadingFinish:[[ArtifactMessage alloc]initNetWorkingErrorWithMsg:receiveMsg.resultMsg]];
    }
}

@end
