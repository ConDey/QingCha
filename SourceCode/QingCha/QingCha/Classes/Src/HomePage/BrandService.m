//
//  BrandService.m
//  QingCha
//
//  Created by eazytec on 16/2/1.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "BrandService.h"

@implementation BrandService

- (void)loadingTopBrandList {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    HttpMessage *httpmessage = [[HttpMessage alloc]initWithDelegate:self
                                                        postDataDic:params
                                                        serivceCode:QC_TopBrand_Loading];
    [self.httpMsgCtrl request:httpmessage];
}

#pragma mark HttpResponseDelegate代理方法

- (void)receiveDidFinished:(HttpMessage *)receiveMsg {
    [super receiveDidFinished:receiveMsg];
    
    if (receiveMsg.serviceCode == QC_TopBrand_Loading) {
        [self.delegate topBrandsLoadingFinish:[[BrandMessage alloc]initWithHttpMessage:receiveMsg]];
    }
}

- (void)receiveDidFailed:(HttpMessage *)receiveMsg {
    [super receiveDidFailed:receiveMsg];
    
    if (receiveMsg.serviceCode == QC_TopBrand_Loading) {
        [self.delegate topBrandsLoadingFinish:[[BrandMessage alloc]initNetWorkingErrorWithMsg:receiveMsg.resultMsg]];
    }
}

@end
