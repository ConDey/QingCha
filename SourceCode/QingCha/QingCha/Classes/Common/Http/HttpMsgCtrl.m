//
//  HttpMsgCtrl.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "HttpMsgCtrl.h"

@implementation HttpMsgCtrl

+ (instancetype)shareInstance {
    static dispatch_once_t once;
    static HttpMsgCtrl * __singleton__;
    dispatch_once( &once, ^{ __singleton__ = [[HttpMsgCtrl alloc] init]; } );
    return __singleton__;
}

- (void)requestHttpMsg:(HttpMessage *)msg {
    
}

@end
