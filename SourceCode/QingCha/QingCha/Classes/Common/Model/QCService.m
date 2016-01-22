//
//  QCService.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "QCService.h"

@implementation QCService

- (id)init {
    if (self = [super init]) {
        _httpMsgCtrl = [HttpMsgCtrl shareInstance];
    }
    return self;
}

#pragma mark HttpResponseDelegate代理方法

- (void)receiveDidFinished:(HttpMessage *)receiveMsg {
    
    NSDictionary *content = receiveMsg.content; // 请求内容
    
    // 设置code
    NSNumber *code = [content objectForKey:HTTP_CODE];
    receiveMsg.resultCode = [NSNumber intValue:code];
    
    // 设置resultMsg
    receiveMsg.resultMsg = [content objectForKey:HTTP_MSG];
}

- (void)receiveDidFailed:(HttpMessage *)receiveMsg {
    
    receiveMsg.resultCode = QC_Error_NetworkingError;
    receiveMsg.resultMsg  = MSG_NETWORKING_ERROR;
}

@end
