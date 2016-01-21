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

- (void)receiveDidFailed:(HttpMessage *)receiveMsg {
    
}


@end
