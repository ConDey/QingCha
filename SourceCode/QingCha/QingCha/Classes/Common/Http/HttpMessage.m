//
//  HttpMessage.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "HttpMessage.h"

@implementation HttpMessage

- (id)init {
    if (self = [super init]) {
        _requestMethod = RequestMethodPost;
        _isHttps = NO;
    }
    return self;
}

- (id)initWithDelegate:(id<HttpResponseDelegate>)delegate
           postDataDic:(NSDictionary *)dataDic
           serivceCode:(SERVICE_CODE)code {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.dataDic = dataDic;
        self.serviceCode = code;
    }
    return self;
}

- (void)cancelDelegate {
    _delegate = nil;
}

- (void)cancelDelegateAndCancel {
    _delegate = nil;
}

@end
